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
    
    static var busStop1: RNSBusStop?
    static var busStop2: RNSBusStop?
    static var busStop3: RNSBusStop?
    static var busStop4: RNSBusStop?
    static var busStop5: RNSBusStop?
    
    
    static var realm: Realm? {
        do {
           return try Realm()
        } catch {
            return nil
        }
    }
    
    static func objects<T>(_ type: T.Type) -> Results<T>? {
        return realm?.objects(type)
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
