//
//  RNSBusStopManager+.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusStopManager {
    
    static func updateBD() {
        prepareOperation(updateOperationBD)
    }
    
    static func updateOperationBD() {
        let uuids = RNSDataManager.bussStopsUuids(lastMinCoord, center: lastCenterCoord)
        updateUuids(uuids)
    }
     
    static func busStops(_ uuids: [String]?) -> [RNSBusStop]? {
        return uuids?.flatMap({ (uuid) -> RNSBusStop? in
            return RNSDataManager.realm?.object(ofType: RNSBusStop.self, forPrimaryKey: uuid)
        })
    }
}
