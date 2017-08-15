//
//  RNSMapManager+Stub.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapManager {
    
    static func prepareStub() {
        prepareStubBusStop()
        prepareStubBus()
    }
    
    static func prepareStubBusStop() {
        RNSDataManager.createStubBusStopIfNeed()
        
        guard let item = RNSDataManager.busStops?.first else {
            return
        }
        item.handlerRemove?()
        _ = RNSPinBusStop(item)
    }
    
    static func prepareStubBus() {
        RNSDataManager.createStubBusIfNeed()
        guard let item = RNSDataManager.buss?.first else {
            return
        }
        item.handlerRemove?()
        _ = RNSPinBus(item)
    }
}
