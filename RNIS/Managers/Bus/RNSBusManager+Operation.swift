//
//  RNSBusManager+Operation.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusManager {
    static func update() {
        queue.cancelAllOperations()
        queue.addOperation(updateOperation)
    }
    
    static func updateOperation() {
        
        var maxCount: Int?
        if RNSMapManager.getZoomLevel <= 14 {
            maxCount = 50
        }
        
        let uuids = RNSDataManager.bussUuids(mapView.lastMinCoord, center: mapView.lastCenterCoord, maxCount: maxCount)
        let addUuids = self.addUuids(uuids)
        let removeUuids = self.removeUuids(uuids)
        Utils.mainQueue {
            removeOld(removeUuids)
            showPinsUuids(addUuids)
            showedUuids = showedItems.flatMap{$0.uuid}
            print("showedBuss",showedUuids.count)
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
    
    static func busItems(_ uuids: [String]?) -> [RNSBus]? {
        return uuids?.flatMap({ (uuid) -> RNSBus? in
            return RNSDataManager.realm?.object(ofType: RNSBus.self, forPrimaryKey: uuid)
        })
    }
}
