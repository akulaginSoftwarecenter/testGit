//
//  RNSRabanc.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.02.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSRabanc: RNISMappableBase {

    var points: [RNSRabancItem]?
    
    public override func mapping(map: Map) {
        points <- map["points"]
        preparePolyline()
    }
    
    var polyline: RNSRoadBus?
    
    func clear() {
        polyline?.clear()
    }
    
    func preparePolyline() {
        polyline = RNSRoadBus(points)
    }
    
    deinit {
        print("RNSRabanc deinit")
    }
}
