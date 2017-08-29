//
//  RNSRouteVariant+Generate.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteVariant {
    
    static var genOne: RNSRouteVariant {
        let item = RNSRouteVariant()
        item.prepareDate()
        item.addRunPoint(59.934338, lon: 30.301333, busStop: busStop1)
        
        
        let point1 = PGGeoPoint(latitude: 59.934896, longitude: 30.303141)
        let bus1 = RNSBusTemp.generate(point1)
        item.addBusPoint(point1.latitude, lon: point1.longitude, bus: bus1, busStop: busStop2)
        item.addBusPoint(59.934225, lon: 30.304228, bus: bus1)
        
        let point2 = PGGeoPoint(latitude: 59.935051, longitude: 30.306572)
        let bus2 = RNSBusTemp.generate(point2)
        item.addBusPoint(point2.latitude, lon: point2.longitude, bus: bus2, busStop: busStop3)
        
        let point3 = PGGeoPoint(latitude: 59.935863, longitude: 30.308822)
        let bus3 = RNSBusTemp.generate(point3)
        
        item.addBusPoint(point3.latitude, lon: point3.longitude, bus: bus3, busStop: busStop4)
        item.addBusPoint(59.936428, lon: 30.310159, bus: bus3)
        item.addBusPoint(59.935282, lon: 30.311911, bus: bus3, busStop: busStop6)
        return item
    }
    
    static var genTwo: RNSRouteVariant {
        let item = RNSRouteVariant()
        item.prepareDate()
        item.addRunPoint(59.934338, lon: 30.301333, busStop: busStop1)
        
        let point1 = PGGeoPoint(latitude: 59.934654, longitude: 30.310087)
        let bus1 = RNSBusTemp.generate(point1)
        item.addRunPoint(59.934896, lon: 30.303141)
        item.addRunPoint(59.934225, lon: 30.304228)
        item.addRunPoint(59.933299, lon: 30.305892)
        item.addBusPoint(point1.latitude, lon: point1.longitude, bus: bus1, busStop: busStop5)
        item.addBusPoint(59.935282, lon: 30.311911, bus: bus1, busStop: busStop6)
        return item
    }
    
    func addRunPoint(_ lat: Double?, lon: Double?, busStop: RNSBusStop? = nil) {
        points.append(RNSRoutePoint(lat, lon: lon, type: .run, busStop: busStop))
    }
    
    func addBusPoint(_ lat: Double?, lon: Double?, bus: RNSBusTemp?, busStop: RNSBusStop? = nil) {
        points.append(RNSRoutePoint(lat, lon: lon, type: .bus, bus: bus, busStop: busStop))
    }
    
    static var busStop1: RNSBusStop? {
        return RNSDataManager.busStop1
    }
    
    static var busStop2: RNSBusStop? {
        return RNSDataManager.busStop2
    }
    
    static var busStop3: RNSBusStop? {
        return RNSDataManager.busStop3
    }
    
    static var busStop4: RNSBusStop? {
        return RNSDataManager.busStop4
    }
    
    static var busStop5: RNSBusStop? {
        return RNSDataManager.busStop5
    }
    
    static var busStop6: RNSBusStop? {
        return RNSDataManager.busStop6
    }
}
