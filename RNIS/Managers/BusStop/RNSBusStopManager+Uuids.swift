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
        let addUuids = self.addUuids(uuids)
        let removeUuids = self.removeUuids(uuids)
        Utils.mainQueue {
            removeOld(removeUuids)
            showPinsUuids(addUuids)
            showedUuids = showedItems.flatMap{$0.uuid}
            print("showedStops",showedUuids.count, RNSMapManager.getZoomLevel)
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
}
