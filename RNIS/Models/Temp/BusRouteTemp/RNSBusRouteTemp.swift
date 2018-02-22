//
//  RNSBusRouteTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 Класс автобусаного маршрута
 */
class RNSBusRouteTemp: RNISMappableBase {
    
    var uuid: String?
    var number: String?
    var in_favorites: Bool?
    var in_notifications: Bool?
    var next: Bool?
    var time: Int?
    
    /// Метод парсинга
    public override func mapping(map: Map) {
        uuid <- map["uuid"]
        number <- map["number"]
        in_favorites <- map["in_favorites"]
        in_notifications <- map["in_notifications"]
        next <- map["next"]
        time <- map["time"]
        prepareTitle()
    }
    
    var doneMove = false
    var title: String?
    var point: PGGeoPoint?
    var handlerRemove: EmptyBlock?
}
