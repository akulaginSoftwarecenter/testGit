//
//  RNSDataManager+BusStop.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import RealmSwift
/**
 Контроллер БД Остановок ТС
 */
extension RNSDataManager {
    
    static var busStops: Results<RNSBusStop>? {
        return realm?.objects(RNSBusStop.self)
    }
    
    static func createStubBusStopIfNeed() {
         let dicts = [["name":"бул. Конногвардейский",
                     "uuid": "1111",
                     "latitude": 59.9344377,
                     "longitude" : 30.3010831],
                     ["name":"Тестовая один",
                      "uuid": "22222",
                      "latitude": 59.934896,
                      "longitude" : 30.303141],
                     ["name":"Исакиевский собор",
                      "uuid": "33333",
                      "latitude": 59.935051,
                      "longitude" : 30.306572],
                     ["name":"пр. Адмиралтейский",
                      "uuid": "44444",
                      "latitude": 59.935863,
                      "longitude" : 30.308822],
                     ["name":"Исакиевский собор",
                      "uuid": "55555",
                      "latitude": 59.934654,
                      "longitude" : 30.310087],
                     ["name":"Пролератарская",
                      "uuid": "66666",
                      "latitude": 59.935267,
                      "longitude" : 30.311943]]
        let items = parseBusStopItems(dicts)
        busStop1 = items?.valueAt(0)
        busStop2 = items?.valueAt(2)
        busStop3 = items?.valueAt(3)
        busStop4 = items?.valueAt(4)
        busStop5 = items?.valueAt(5)
        busStop6 = items?.valueAt(6)
    }
    
    static func parseBusStopItemsAsync(_ dicts: [AliasDictionary], complete: AliasStringArrayBlock?) {
        DispatchQueue.global(qos: .userInitiated).async {
            let items = parseItems(dicts) as [RNSBusStop]
            let uuids: [String] = items.flatMap{$0.uuid}
            Utils.mainQueue {
                complete?(uuids)
            }
        }
    }
    
    static func parseBusStopItems(_ dicts: [AliasDictionary]) -> [RNSBusStop]? {
        return parseItems(dicts)
    }
    
    static func bussStopsUuids(_ min: PGGeoPoint, center: PGGeoPoint) -> [String]? {
        guard let results = busStops else {
            return nil
        }
        return modelsUuids(Array(results), min: min, center: center)
    }
    
    static func removeAllBusStop() {
        Utils.mainQueue {
            guard let busStops = busStops else {
                return
            }
            write ({
                realm?.delete(busStops)
            })
        }
    }
}
