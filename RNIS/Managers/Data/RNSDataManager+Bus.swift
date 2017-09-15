//
//  RNSDataManager+Bus.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import RealmSwift

extension RNSDataManager {
    
    static var buss: Results<RNSBus>? {
        return realm?.objects(RNSBus.self)
    }
    
    static func createStubBusIfNeed() {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        guard buss?.count == 0  else {
            return
        }
        
         write({
            if let items = buss {
                realm?.delete(items)
            }
            
            let item = RNSBus()
            item.generate()
            realm?.add(item)
        })
    }
    
    static func generateBusList(complete: (([RNSBus])->())? ) {
        var items = [RNSBus]()
        write({
            for index in 0...Int.rand(1, limit: 20) {
                guard let item = realm?.create(RNSBus.self, value: [kUuid: "\(index)"], update: true) else {
                    continue
                }
                item.generate()
                items.append(item)
            }
        }, complete: {
            Utils.delay(2) {
                complete?(items)
            }
        })
    }

    static func parseBusItemsAsync(_ dicts: [AliasDictionary], complete: (([RNSBus]) -> ())?) {
        parseItemsAsync(dicts, complete: complete)
    }

    static func bussUuids(_ min: PGGeoPoint, center: PGGeoPoint, maxCount: Int? = nil) -> [String]? {
        guard let results = buss else {
            return nil
        }
        return modelsUuids(Array(results), min: min, center: center, maxCount: maxCount)
    }
    
    static func removeAllBuss() {
        Utils.mainQueue {
            guard let buss = buss else {
                return
            }
            write ({
                realm?.delete(buss)
            })
        }
    }
}
