//
//  RNSFavoriteRouteListPayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 Класс избранных маршрутов автобусов
 */
class RNSFavoriteRouteListPayload: RNISMappableBase {
    var stop_points: [RNSFavoriteStopPoint]?
    
    public override func mapping(map: Map) {
        stop_points <- map["stop_points"]
    }
}
