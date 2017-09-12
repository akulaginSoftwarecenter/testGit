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
        /*
        removeOLdBusStops()
        RNSDataManager.createStubBusStopIfNeed()
        showPinBusStopAll()
         */
    }
    
    static func prepareStubBusStopAsunc() {
        removeOLdBusStops()
        RNSDataManager.createStubBusStopAsync { (items) in
            print("items")
            //showPinBusStop()
        }
  
    }
    
    static func showPinBusStopAll() {
        guard let items = RNSDataManager.busStops else {
            return
        }
        showPinBusStop(Array(items))
    }
    
    static func showPinBusStop(_ items: [RNSBusStop]?) {
        guard let items = items else {
            return
        }
        showedStops = items
        for item in items {
            item.handlerRemove?()
            _ = RNSPinBusStop(item)
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
