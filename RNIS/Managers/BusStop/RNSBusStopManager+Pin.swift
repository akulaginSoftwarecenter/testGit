//
//  RNSBusStopManager+Pin.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusStopManager {
    
    static func showPinsUuids(_ uuids: [String]?) {
        guard let items = busStops(uuids) else {
            return
        }
        showPinsItems(items)
    }
    
    static func showPinsItems(_ items: [RNSBusStop]?) {
        guard let items = items else {
            return
        }
        showedItems.append(contentsOf: items)
        for item in items {
            item.handlerRemove?()
            _ = RNSPinBusStop(item)
        }
    }
    
    static func showPinAll() {
        guard let items = RNSDataManager.busStops else {
            return
        }
        showPinsItems(Array(items))
    }
    
    static func removeOldAll() {
        for item in showedItems {
            item.handlerRemove?()
        }
        self.showedItems = [RNSBusStop]()
        self.showedUuids = [String]()
    }
    
    static func removeOld(_ uuids: [String]?) {
        guard let uuids = uuids else {
            return
        }
        let items = showedItems.filter{ uuids.contains($0.uuid) }
        for item in items {
            item.handlerRemove?()
        }
        showedItems = showedItems.filter{ !items.contains($0) }
    }
}
