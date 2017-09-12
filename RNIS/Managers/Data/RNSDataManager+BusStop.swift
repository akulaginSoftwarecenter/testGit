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
        if (busStops?.count ?? 0) != 0 {
            return
        }
        
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
        let items = parseBusStopItems(dicts)
        busStop1 = items.valueAt(0)
        busStop2 = items.valueAt(2)
        busStop3 = items.valueAt(3)
        busStop4 = items.valueAt(4)
        busStop5 = items.valueAt(5)
        busStop6 = items.valueAt(6)
    }
    
    static func createStubBusStopAsync(complete: (([RNSBusStop])->())?) {
       removeAllBusStop()
       CounterTime.startTimer()
        createStubDictStops { (dicts) in
            CounterTime.endTimer()
            parseBusStopItemsAsync(dicts, complete: { (items) in
                CounterTime.endTimer()
                complete?(items)
            })
        }
    }
    
    static func createStubDictStops(complete: (([AliasDictionary]) -> ())?) {
        var dicts = [AliasDictionary]()
        
        CounterTime.startTimer()
        let location = RNSLocationManager.point
        DispatchQueue.global(qos: .userInitiated).async {
            for index in 7...10000 {
                dicts.append(["name":"test",
                              "uuid": "\(index)",
                    "latitude": location.latitude,
                    "longitude" : location.longitude + Double(index)/1000 ])
            }
            Utils.mainQueue {
                complete?(dicts)
            }
        }
    }
    
    static func addBusStop(_ uuid: String ,title: String?, lat: Double, lon: Double) -> RNSBusStop {
        let item = RNSBusStop.generate(uuid, name: title, lat: lat, lon: lon)
        realm?.add(item)
        return item
    }
    
    static func removeAllBusStop() {
        DispatchQueue.main.async {
            guard let busStops = busStops else {
                return
            }
            write ({
                realm?.delete(busStops)
            })
        }
    }
    
    static func parseBusStopItems(_ dicts: [AliasDictionary]) -> [RNSBusStop] {
        var items = [RNSBusStop]()
        write ({
            for dict in dicts {
                guard let busStop = realm?.create(RNSBusStop.self, value: dict, update: true) else {
                    continue
                }
                items.append(busStop)
            }
            
        })
        return items
    }
    
    static func parseBusStopItemsAsync(_ dicts: [AliasDictionary], complete: (([RNSBusStop]) -> ())?) {
        DispatchQueue.global(qos: .userInitiated).async {
            let items = parseBusStopItems(dicts)
            DispatchQueue.main.async {
                complete?(items)
            }
        }
    }
    
    static func bussStops(_ min: PGGeoPoint, center: PGGeoPoint) -> [RNSBusStop]? {
        guard let results = busStops else {
            return nil
        }
        let distance = min.distanceTo(center)
        return Array(results).filter{
            return center.distanceTo($0.point) < distance
        }
    }
    
    static func bussStopsUuids(_ min: PGGeoPoint, center: PGGeoPoint) -> [String]? {
        let items = bussStops(min, center: center)
        return items?.flatMap{$0.uuid}
    }
}
