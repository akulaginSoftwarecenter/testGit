//
//  RNSFavoriteStopPoint.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSFavoriteStopPoint: RNISMappableBase {
    var forecast: [RNSForecastBus]?
    var stop_point_title: String?
    var stop_point_uuid: String?
    
    public override func mapping(map: Map) {
        forecast <- map["forecast"]
        stop_point_title <- map["stop_point_title"]
        stop_point_uuid <- map["stop_point_uuid"]
    }
    
    var height: CGFloat {
        return CGFloat(45 + (forecast?.count ?? 0) * 49)
    }
}
