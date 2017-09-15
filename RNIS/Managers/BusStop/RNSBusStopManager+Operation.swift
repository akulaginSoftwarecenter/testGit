//
//  RNSBusStopManager+.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusStopManager {
    
    static func update() {
        
        let operation = BlockOperation(block:{
            updateOperation()
        })
        
        queue.cancelAllOperations()
        queue.addOperation(operation)
    }
    
    static func updateOperation() {
        
        guard RNSMapManager.getZoomLevel > 14 else {
            Utils.mainQueue {
                removeOldAll()
            }
            return
        }
        let uuids = RNSDataManager.bussStopsUuids(mapView.lastMinCoord, center: mapView.lastCenterCoord)
        let addUuids = self.addUuids(uuids)
        let removeUuids = self.removeUuids(uuids)
        Utils.mainQueue {
            removeOld(removeUuids)
            showPinsUuids(addUuids)
            showedUuids = showedItems.flatMap{$0.uuid}
            print("showedStops",showedUuids.count)
        }
    }
    
    static func addUuids(_ uuids: [String]?) -> [String]? {
        return uuids?.filter{!showedUuids.contains($0)}
    }
    
    static func removeUuids(_ uuids: [String]?) -> [String]? {
        guard let uuids = uuids else {
            return nil
        }
        return showedUuids.filter{ !uuids.contains($0) }
    }
     
    static func busStops(_ uuids: [String]?) -> [RNSBusStop]? {
        return uuids?.flatMap({ (uuid) -> RNSBusStop? in
            return RNSDataManager.realm?.object(ofType: RNSBusStop.self, forPrimaryKey: uuid)
        })
    }
}
