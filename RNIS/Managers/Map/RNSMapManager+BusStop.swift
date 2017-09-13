//
//  RNSMapManager+BusStop.swift
//  RNIS
//
//  Created by Артем Кулагин on 13.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapManager {

    static func bussStopsUpdate() {
        
        let operation = BlockOperation(block:{
            bussStopsUpdateOperation()
        })
        
        queue.cancelAllOperations()
        queue.addOperation(operation)
    }
    
    static func bussStopsUpdateOperation() {
        guard getZoomLevel > 14 else {
            Utils.mainQueue {
                removeOLdBusStopsAll()
            }
            return
        }
        
        let uuids = RNSDataManager.bussStopsUuids(mapView.lastMinCoord, center: mapView.lastCenterCoord)
        let addUuids = self.addUuids(uuids)
        let removeUuids = self.removeUuids(uuids)
        Utils.mainQueue {
            removeOLdBusStops(removeUuids)
            showPinBusStopUuids(addUuids)
            showedStopsUuids = showedStops.flatMap{$0.uuid}
        }
    }
    
    static func addUuids(_ uuids: [String]?) -> [String]? {
        return uuids?.filter{!showedStopsUuids.contains($0)}
    }
    
    static func removeUuids(_ uuids: [String]?) -> [String]? {
        guard let uuids = uuids else {
            return nil
        }
        return showedStopsUuids.filter{ !uuids.contains($0) }
    }
    
    static func showPinBusStopUuids(_ uuids: [String]?) {
        guard let items = busStops(uuids) else {
            return
        }
        showPinBusStop(items)
    }
    
    static func showPinBusStop(_ items: [RNSBusStop]?) {
        guard let items = items else {
            return
        }
        showedStops.append(contentsOf: items)
        for item in items {
            item.handlerRemove?()
            _ = RNSPinBusStop(item)
        }
    }
    
    static func removeOLdBusStopsAll() {
        for item in showedStops {
            item.handlerRemove?()
        }
        self.showedStops = [RNSBusStop]()
        self.showedStopsUuids = [String]()
    }
    
    static func removeOLdBusStops(_ uuids: [String]?) {
        guard let uuids = uuids else {
            return
        }
        let items = showedStops.filter{ uuids.contains($0.uuid) }
        for item in items {
            item.handlerRemove?()
        }
        showedStops = showedStops.filter{ !items.contains($0) }
    }
    
    static func busStops(_ uuids: [String]?) -> [RNSBusStop]? {
        return uuids?.flatMap({ (uuid) -> RNSBusStop? in
            return RNSDataManager.realm?.object(ofType: RNSBusStop.self, forPrimaryKey: uuid)
        })
    }

}
