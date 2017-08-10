//
//  RNSDataManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import RealmSwift

class RNSDataManager: NSObject {
    
    static var realm: Realm? {
        do {
           return try Realm()
        } catch {
            return nil
        }
    }
    
    static var busStops: Results<RNSBusStop>? {
        return realm?.objects(RNSBusStop.self)
    }
    
    static func createStubStubBusIfNeed() {
        guard busStops?.count == 0  else {
            return
        }
        write({
            let item = RNSBusStop()
            item.title = "бул. Конногвардейский"
            item.latitude = 59.9344377
            item.longitude = 30.3010831
            realm?.add(item)
        })
    }
    
    static func generateBusList(complete: (([RNSBus])->())? ) {
        var items = [RNSBus]()
         write({
            for _ in 0...Int.rand(1, limit: 20) {
                let item = RNSBus()
                item.generate()
                realm?.add(item)
                items.append(item)
            }
        }, complete: {
            Utils.delay(2) {
                complete?(items)
            }
        })
    }
    
    static func write(_ block: EmptyBlock?, complete: EmptyBlock? = nil) {
        do {
            try realm?.write {
                block?()
            }
            complete?()
        } catch {}
    }
}
