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
        print("buss?.count",RNSDataManager.busStops?.count as Any)
        guard let items = RNSDataManager.busStops else {
            return
        }
        for item in items {
            item.handlerRemove?()
            _ = RNSPinBusStop(item)
        }
    }
    
    static func prepareStubBusStopAsunc() {
        removeOLdBusStops()
        RNSDataManager.createStubBusStopAsync { (items) in
            print("items")
        }
  
    }
    
    static func removeOLdBusStops() {
        guard let items = RNSDataManager.busStops else {
            return
        }
        for item in items {
            item.handlerRemove?()
        }
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
