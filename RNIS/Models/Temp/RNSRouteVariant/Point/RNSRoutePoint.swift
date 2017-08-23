//
//  RNSRouteVariantPoint.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

enum TypePoint {
    case run, bus
}

class RNSRoutePoint {
    var point: PGGeoPoint?
    var type: TypePoint?
    var bus: RNSBusTemp?
    var busStop: RNSBusStop?
    
    init(_ lat: Double?, lon: Double?, type: TypePoint? = nil, bus: RNSBusTemp? = nil, busStop: RNSBusStop? = nil) {
        if let lat = lat, let lon = lon {
            self.point = PGGeoPoint(latitude: lat, longitude: lon)
        }
        self.type = type
        self.bus = bus
    }
}
