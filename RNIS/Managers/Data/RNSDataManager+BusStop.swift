//
//  RNSDataManager+BusStop.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import RealmSwift

extension RNSDataManager {
    
    static var busStops: Results<RNSBusStop>? {
        return realm?.objects(RNSBusStop.self)
    }
    
    static func createStubBusStopIfNeed() {
        write({
            removeAllBusStop()
            busStop1 = addBusStop("бул. Конногвардейский", lat: 59.9344377, lon: 30.3010831)
            busStop2 = addBusStop("Тестовая один", lat: 59.934896, lon: 30.303141)
            busStop3 = addBusStop("Исакиевский собор", lat: 59.935051, lon: 30.306572)
            busStop4 = addBusStop("пр. Адмиралтейский", lat: 59.935863, lon: 30.308822)
            busStop5 = addBusStop("Исакиевский собор", lat: 59.934654, lon: 30.310087)
        })
    }
    
    static func addBusStop(_ title: String?, lat: Double, lon: Double) -> RNSBusStop {
        let item = RNSBusStop.generate(title, lat: lat, lon: lon)
        realm?.add(item)
        return item
    }
    
    static func removeAllBusStop() {
        guard let busStops = busStops else {
            return
        }
        realm?.delete(busStops)
    }
}
