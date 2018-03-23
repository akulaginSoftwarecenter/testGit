//
//  RNSRouteVariantPoint.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

enum TypePoint: String {
    case run, bus
}

/**
 Класс точки маршрута
 */
class RNSRoutePoint: RNISMappableBase {
    /// переменная широта сущности
    var latitude: Double?
    /// переменная долгота сущности
    var longitude: Double?
    var time: Int?
    var typePoint: String?
    var stop_point: RNSBusStopTemp?
    var route: RNSBusRouteTemp?
    /// переменная имени сущности
    var name: String?
    
    /// Метод парсинга
    public override func mapping(map: Map) {
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        preparePoint()
        time <- map["time"]
        typePoint <- map["type"]
        prepareType()
        stop_point <- map["stop_point"]
        route <- map["route"]
        name <- map["name"]
        prepareRoute()
        prepareHashValue()
    }
    
    /// точка инициализации
    var point: PGGeoPoint?
    var type: TypePoint?
    var doneMove = false
    var removeVariantEnd: EmptyBlock?
    var hashValue: Int = 0
}
