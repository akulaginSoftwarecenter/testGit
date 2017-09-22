//
//  RNSBusStopManager+Server.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import Alamofire

extension RNSBusStopManager {
    
    static func updateServer(complete: EmptyBlock?) {
        CounterTime.startTimer()
        updateBD()
        request?.cancel()
        request = RNSPostStopPointList(lastMinCoord, center: lastCenterCoord, maxCount: maxCount, complete: { (uuids) in
            CounterTime.endTimer()
            updateOperationServer(uuids)
            complete?()
        })
    }
    
    static func updateOperationServer(_ uuids: [String]?) {
        prepareOperation {
            updateUuids(uuids)
        }
    }
}