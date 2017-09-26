//
//  RNSMoveBusManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 26.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMoveBusManager: NSObject {
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
        CounterTime.startTimer()
        RNSBusManager.showedItems.forEach({
            if uuids.contains($0.uuid) {
                $0.handlerUpdateLocaton?()
            }
        })
        CounterTime.endTimer()
    }
}
