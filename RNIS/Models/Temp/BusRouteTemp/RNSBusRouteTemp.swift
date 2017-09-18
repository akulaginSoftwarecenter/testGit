//
//  RNSBusRouteTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSBusRouteTemp: RNISMappableBase {
    
    var uuid: String?
    var number: String?
    
    public override func mapping(map: Map) {
        uuid <- map["uuid"]
        number <- map["number"]
    }
}
