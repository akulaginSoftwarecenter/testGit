//
//  RNSRouteVariantPoint.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

enum TypePoint: Int {
    case run = 0, bus
}

class RNSRoutePoint: Hashable {
    var point: PGGeoPoint?
    var type: TypePoint?
    var bus: RNSBusTemp?
    var busStop: RNSBusStop?
    
    var doneMove = false
    
    init(_ lat: Double?, lon: Double?, type: TypePoint? = nil, bus: RNSBusTemp? = nil, busStop: RNSBusStop? = nil) {
        if let lat = lat, let lon = lon {
            self.point = PGGeoPoint(latitude: lat, longitude: lon)
        }
        self.busStop = busStop
        self.type = type
        self.bus = bus
    }
    
    var hashValue: Int {
        guard let point = point else {
            return -1
        }
        return Int(point.latitude * 10000 + point.longitude * 1000) + (type?.rawValue ?? 0)
    }
    
    static func ==(lhs: RNSRoutePoint, rhs: RNSRoutePoint) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func different(_ point: RNSRoutePoint?) -> Bool {
        guard let point = point,
            let selfType = self.type,
            let pointType = point.type else {
            return false
        }
        return selfType != pointType || bus != point.bus
    }
    
    func distanceTo(_ point: RNSRoutePoint?) -> CLLocationDistance? {
        return self.point?.distanceTo(point?.point)
    }
    
    var isRun: Bool {
        guard let type = type else {
            return false
        }
        return type == .run
    }
    
    var isBus: Bool {
        guard let type = type else {
            return false
        }
        return type == .bus
    }
    
    var removeVariantEnd: EmptyBlock?
    
    var verticalTableItem: RNSVerticalTableItem {
        return RNSVerticalTableItem(self)
    }
}
