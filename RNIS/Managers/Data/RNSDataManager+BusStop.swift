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
        let dicts = [["name":"бул. Конногвардейский",
                     "uuid": "1",
                     "latitude": 59.9344377,
                     "longitude" : 30.3010831],
                     ["name":"Тестовая один",
                      "uuid": "2",
                      "latitude": 59.934896,
                      "longitude" : 30.303141],
                     ["name":"Исакиевский собор",
                      "uuid": "3",
                      "latitude": 59.935051,
                      "longitude" : 30.306572],
                     ["name":"пр. Адмиралтейский",
                      "uuid": "4",
                      "latitude": 59.935863,
                      "longitude" : 30.308822],
                     ["name":"Исакиевский собор",
                      "uuid": "5",
                      "latitude": 59.934654,
                      "longitude" : 30.310087],
                     ["name":"Пролератарская",
                      "uuid": "6",
                      "latitude": 59.935267,
                      "longitude" : 30.311943]]

        parseBusStopItems(dicts) { (items) in
            print("result",items.count)
        }
        /*
        write({
            removeAllBusStop()
            busStop1 = addBusStop("бул. Конногвардейский", lat: 59.9344377, lon: 30.3010831)
            busStop2 = addBusStop("Тестовая один", lat: 59.934896, lon: 30.303141)
            busStop3 = addBusStop("Исакиевский собор", lat: 59.935051, lon: 30.306572)
            busStop4 = addBusStop("пр. Адмиралтейский", lat: 59.935863, lon: 30.308822)
            busStop5 = addBusStop("Исакиевский собор", lat: 59.934654, lon: 30.310087)
            busStop6 = addBusStop("Пролератарская", lat: 59.935267, lon: 30.311943)
         
        })
    */
    }
    /*
    func createStubDictStops(complete: (([AliasDictionary]) -> ())?) {
        DispatchQueue.main.async {
            var dicts = [["name":"бул. Конногвардейский",
                          "uuid": "1",
                          "latitude": 59.9344377,
                          "longitude" : 30.3010831],
                         ["name":"Тестовая один",
                          "uuid": "2",
                          "latitude": 59.934896,
                          "longitude" : 30.303141],
                         ["name":"Исакиевский собор",
                          "uuid": "3",
                          "latitude": 59.935051,
                          "longitude" : 30.306572],
                         ["name":"пр. Адмиралтейский",
                          "uuid": "4",
                          "latitude": 59.935863,
                          "longitude" : 30.308822],
                         ["name":"Исакиевский собор",
                          "uuid": "5",
                          "latitude": 59.934654,
                          "longitude" : 30.310087],
                         ["name":"Пролератарская",
                          "uuid": "6",
                          "latitude": 59.935267,
                          "longitude" : 30.311943]]
            CounterTime.startTimer()
            for index in 7...100000 {
                dicts.append(["name":"test",
                              "uuid": "\(index)",
                    "latitude": 59.9344377,
                    "longitude" : 30 + Float(index)/1000 ])
            }
        }
        
    }
    */
    static func addBusStop(_ uuid: String ,title: String?, lat: Double, lon: Double) -> RNSBusStop {
        let item = RNSBusStop.generate(uuid, name: title, lat: lat, lon: lon)
        realm?.add(item)
        return item
    }
    
    static func removeAllBusStop() {
        guard let busStops = busStops else {
            return
        }
        realm?.delete(busStops)
    }
    
    static func parseBusStopItems(_ dicts: [AliasDictionary], complete: (([RNSBusStop]) -> ())?) {
            var items = [RNSBusStop]()
            write ({
                for dict in dicts {
                    guard let busStop = realm?.create(RNSBusStop.self, value: dict, update: true) else {
                        continue
                    }
                    items.append(busStop)
                }
                
            })
            complete?(items)
    }
}
