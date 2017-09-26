//
//  RNSMoveBusManager+Operation.swift
//  RNIS
//
//  Created by Артем Кулагин on 26.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMoveBusManager {
    
    static func parse(_ items: [AliasDictionary]?) {
        guard let items = items else {
            return
        }
        
        RNSDataManager.parseBusItemsAsync(items) {  (uuids) in
            updateUuids(uuids)
        }
    }
    
    static func updateUuids(_ uuids: [String]?) {
        guard let uuids = uuids else {
            return
        }
        uuids.forEach({ item in
            queue.addOperation {
                operation(item)
            }
        })
    }
    
    static func operation(_ uuid: String?) {
        guard let uuid = uuid else {
            return
        }
        usleep(1000)
        let index = RNSBusManager.showedUuids.index(of: uuid)
        updateItem(index)
    }
    
    static func updateItem(_ index:  Int?) {
        guard let index = index else {
            return
        }
        Utils.mainQueue {
            if let item = RNSBusManager.showedItems.valueAt(index) {
                item.handlerUpdateLocaton?()
            }
        }
    }
}
