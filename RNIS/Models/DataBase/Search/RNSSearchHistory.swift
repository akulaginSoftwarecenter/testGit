//
//  RNSSearchHistory.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import RealmSwift
/**
 Класс истории поиска
 */
class RNSSearchHistory: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var latitude = 0.0
    @objc dynamic var longitude = 0.0
    
    override static func ignoredProperties() -> [String] {
        return ["point"]
    }
    
    var point: PGGeoPoint? {
        get {
            guard latitude != 0,
                longitude != 0 else {
                    return nil
            }
            return PGGeoPoint(latitude: latitude, longitude: longitude)
        }
        set {
            guard let newValue = newValue else {
                return
            }
            latitude = newValue.latitude
            longitude = newValue.longitude
        }
    }
}
