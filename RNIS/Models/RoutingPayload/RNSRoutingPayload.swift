//
//  RNSRoutingPayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 24.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSRoutingPayload: RNISMappableBase {
    
    var distance: CGFloat?
    var points: [RNSPoint]?
    
    public override func mapping(map: Map) {
        distance <- map["distance"]
        points <- map["points"]
    }
}
