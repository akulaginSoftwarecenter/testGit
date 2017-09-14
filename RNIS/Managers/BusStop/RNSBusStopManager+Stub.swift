//
//  RNSBusStopManager+Stub.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusStopManager {
    
    static func prepareStubBusStop() {
        removeOLdBusStopsAll()
        RNSDataManager.createStubBusStopIfNeed()
        showPinBusStopAll()
    }
    
    static func prepareStubBusStopAsunc() {
        removeOLdBusStopsAll()
        RNSDataManager.createStubBusStopAsync { (items) in
            print("createStubBusStopAsync", items.count)
            //showPinBusStop()
        }
    }
    
    static func showPinBusStopAll() {
        guard let items = RNSDataManager.busStops else {
            return
        }
        showPinBusStop(Array(items))
    }
}
