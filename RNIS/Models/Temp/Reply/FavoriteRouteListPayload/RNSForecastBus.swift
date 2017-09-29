//
//  RNSForecastBus.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSForecastBus: RNISMappableBase {
 
    var route_number: String?
    var time: Int?
    
    public override func mapping(map: Map) {
        route_number <- map["route_number"]
        time <- map["time"]
    }
}
