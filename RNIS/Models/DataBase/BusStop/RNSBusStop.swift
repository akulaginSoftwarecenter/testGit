//
//  BusStop.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import RealmSwift

class RNSBusStop: Object {
    
    dynamic var title: String = ""
    dynamic var latitude = 0.0
    dynamic var longitude = 0.0
    
    var point: PGGeoPoint {
        return PGGeoPoint(latitude: latitude, longitude: longitude)
    }
}
