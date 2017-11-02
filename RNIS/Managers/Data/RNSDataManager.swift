//
//  RNSDataManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import RealmSwift
/**
 Контроллер БД
 */
class RNSDataManager: NSObject {
    static let shared = RNSDataManager()
    
    static var busStop1: RNSBusStop?
    static var busStop2: RNSBusStop?
    static var busStop3: RNSBusStop?
    static var busStop4: RNSBusStop?
    static var busStop5: RNSBusStop?
    static var busStop6: RNSBusStop?
    
    static var realm: Realm? {
        do {
           return try Realm()
        } catch {
            return nil
        }
    }
    
    static func objects<T>(_ type: T.Type) -> Results<T>? {
        guard let result = realm?.objects(type as! Object.Type) as? Results<T> else {
            return nil
        }
        return result
    }
    
    static func write(_ block: EmptyBlock?, complete: EmptyBlock? = nil) {
        do {
            try realm?.write {
                block?()
            }
            complete?()
        } catch {}
    }
    
    static func parseItems<T: RNSCoordinateModel>(_ dicts: [AliasDictionary]) -> [T] {
        var items = [T]()
        write ({
            for dict in dicts {
                guard let item = realm?.create(T.self, value: dict, update: true) else {
                    continue
                }
                items.append(item)
            }
            
        })
        return items
    }
    
    static func models<T: RNSCoordinateModel>(_ items: [RNSCoordinateModel], min: PGGeoPoint, center: PGGeoPoint) -> [T]? {
        let distance = min.distanceTo(center)
        return items.filter {
            return center.distanceTo($0.point) < distance
        } as? [T]
    }
    
    static func modelsUuids(_ items: [RNSCoordinateModel], min: PGGeoPoint, center: PGGeoPoint, maxCount: Int? = nil) -> [String]? {
        var items = models(items, min: min, center: center)
        if let maxCount = maxCount,
            let array = items {
            items = Array(array.prefix(maxCount))
        }
        return items?.flatMap{$0.uuid}
    }
}
