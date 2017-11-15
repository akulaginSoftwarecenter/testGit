//
//  RNSCoordinateModel.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import RealmSwift

/**
 RNSCoordinateModel
 */

class RNSCoordinateModel: Object {
    
    @objc dynamic var uuid = ""
    @objc dynamic var latitude = 0.0
    @objc dynamic var longitude = 0.0
    
    override static func primaryKey() -> String? {
        return kUuid
    }
    
    var handlerUpdateIcon: EmptyBlock?
    var handlerRemove: EmptyBlock?
    var handlerUpdateLocaton: EmptyBlock?
    
    override static func ignoredProperties() -> [String] {
        return ["handlerRemove", "point", "isHaveCoordinate", "handlerUpdateIcon", "handlerUpdateLocaton"]
    }
    
    var point: PGGeoPoint {
        return PGGeoPoint(latitude: latitude, longitude: longitude)
    }
    
    var isHaveCoordinate: Bool {
        return !((latitude == 0) && (longitude == 0))
    }
     
    func updateIcon() {
        handlerUpdateIcon?()
    }
}
