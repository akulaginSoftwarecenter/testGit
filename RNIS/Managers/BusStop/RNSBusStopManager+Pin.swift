//
//  RNSBusStopManager+Pin.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusStopManager {
    
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
}
