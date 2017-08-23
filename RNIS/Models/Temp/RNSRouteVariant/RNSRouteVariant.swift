//
//  RNSRouteVariant.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteVariant: RNISMappableBase {
    
    var roadActivate: [PGPolyline]?
    var roadOff: RNSRoadOff?
    
    var durationMinute: Int?
    var endDate: Date?
    
    var points = [RNSRoutePoint]()
    
    var buss: [RNSBusTemp] {
        let buss = points.flatMap{$0.bus}
        return buss.unique
    }
    
    static var genOne: RNSRouteVariant {
        let item = RNSRouteVariant()
        item.prepareDate()
        item.addRunPoint(59.934338, lon: 30.301333, busStop: busStop1)
        
        let bus1 = RNSBusTemp.generate
        item.addBusPoint(59.934896, lon: 30.303141, bus: bus1, busStop: busStop2)
        item.addBusPoint(59.934225, lon: 30.304228, bus: bus1)
        
        let bus2 = RNSBusTemp.generate
        item.addBusPoint(59.935051, lon: 30.306572, bus: bus2, busStop: busStop3)
        
        let bus3 = RNSBusTemp.generate
        item.addBusPoint(59.935863, lon: 30.308822, bus: bus3, busStop: busStop4)
        item.addBusPoint(59.936428, lon: 30.310159, bus: bus3)
        item.addBusPoint(59.935282, lon: 30.311911, bus: bus3)
        item.prepareRoadOff()
        //item.prepareRoadActivate()
        return item
    }
    
    static var genTwo: RNSRouteVariant {
        let item = RNSRouteVariant()
        item.prepareDate()
        item.addRunPoint(59.934338, lon: 30.301333, busStop: busStop1)
        
        let bus1 = RNSBusTemp.generate
        item.addBusPoint(59.934896, lon: 30.303141, bus: bus1, busStop: busStop2)
        item.addBusPoint(59.934225, lon: 30.304228, bus: bus1)
        item.addBusPoint(59.933299, lon: 30.305892, bus: bus1)
        item.addBusPoint(59.934654, lon: 30.310087, bus: bus1, busStop: busStop5)
        item.addBusPoint(59.935282, lon: 30.311911, bus: bus1)
        //item.prepareRoadActivate()
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
    
    var titleWidthBuss: CGFloat {
        var width = CGFloat(0)
        for item in buss {
            width += item.titleWidth
        }
        return width
    }
    
    func prepareDate() {
        let durationMinute = Int.rand(1, limit: 40)
        self.durationMinute = durationMinute
        endDate = Date().appendMinute(durationMinute)
    }
}
