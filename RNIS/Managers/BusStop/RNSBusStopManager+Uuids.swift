//
//  RNSBusStopManager+Uuids.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusStopManager {
    
    static func updateUuids(_ uuids: [String]?) {
        updateUuids(addUuids: addUuids(uuids), removeUuids: removeUuids(uuids))
    }
    
    static func updateUuids(addUuids: [String]? = nil, removeUuids:[String]?) {
        Utils.mainQueue {
            removeOld(removeUuids)
            showPinsUuids(addUuids)
            showedUuids = showedItems.flatMap{$0.uuid}
            print("showedStops",showedUuids.count, RNSMapManager.getZoomLevel)
        }
    }
    
    static func removeAll() {
        updateUuids(removeUuids: showedUuids)
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
}
