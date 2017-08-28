//
//  RNSRouteVariant.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteVariant: RNISMappableBase, Hashable {
    
    var roadActivate: [PGPolyline]?
    var roadOff: RNSRoadOff?
    
    var currentZoom: Int?
    
    var durationMinute: Int?
    var endDate: Date?
    
    var points = [RNSRoutePoint]()
    
    var bussPins: [RNSPinVariantBus]?
     
    func prepareDate() {
        let durationMinute = Int.rand(1, limit: 40)
        self.durationMinute = durationMinute
        endDate = Date().appendMinute(durationMinute)
    }
     
    func removeAllRoad() {
        removeRoadOff()
        removeRoadActivate()
    }
}
