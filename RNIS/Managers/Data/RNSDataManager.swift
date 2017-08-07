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
        
        write {
            let item = RNSBusStop()
            item.title = "бул. Конногвардейский"
            item.latitude = 59.9344377
            item.longitude = 30.3010831
            realm?.add(item)
        }
    }
    
    static func write(_ block: EmptyBlock?) {
        do {
            try realm?.write {
                block?()
            }
        } catch {}
    }
}
