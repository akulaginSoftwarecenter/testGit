//
//  RNSBusManager+Operation.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusManager {
    
    static func updateBD() {
        prepareOperation(updateOperationBD)
    }
    
    static func updateOperationBD() {
        let uuids = RNSDataManager.bussUuids(lastMinCoord, center: lastCenterCoord)
        updateUuids(uuids)
    }
    
    static func buss(_ uuids: [String]?) -> [RNSBus]? {
        return uuids?.flatMap({ (uuid) -> RNSBus? in
            return RNSDataManager.realm?.object(ofType: RNSBus.self, forPrimaryKey: uuid)
        })
    }
}
