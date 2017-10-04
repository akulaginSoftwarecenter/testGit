//
//  RNSNotificationModel.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSNotificationModel: RNISMappableBase {
    var notification_time: Int?
    var route_number: String?
    var route_uuid: String?
    var stop_point: RNSBusStopTemp?
    var uuid: String?
    
    public override func mapping(map: Map) {
        notification_time <- map["notification_time"]
        route_number <- map["route_number"]
        route_uuid <- map["route_uuid"]
        stop_point <- map["stop_point"]
        uuid <- map[kUuid]
    }
}
