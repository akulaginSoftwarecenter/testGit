//
//  RNSBusTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 Класс автобуса
 */
class RNSBusTemp: RNISMappableBase, RNSTextItem {

    /// переменная уникальный идентификатор сущности
    var uuid: String?
    var carrier_name: String?
    var check_taker: String?
    var driver: String?
    var has_air_conditioning: Bool?
    var has_cashless_payment: Bool?
    var next_stop_point: RNSBusStopTemp?
    var route_number: String?
    var stop_points: [RNSBusStopTemp]?
    var unit_name: String?
    var unit_phone: String?
   
    /// Метод парсинга
    public override func mapping(map: Map) {
        uuid <- map["uuid"]
        carrier_name <- map["carrier_name"]
        check_taker <- map["check_taker"]
        driver <- map["driver"]
        has_air_conditioning <- map["has_air_conditioning"]
        has_cashless_payment <- map["has_cashless_payment"]
        next_stop_point <- map["next_stop_point"]
        route_number <- map["route_number"]
        stop_points <- map["stop_points"]
        unit_name <- map["unit_name"]
        unit_phone <- map["unit_phone"]
    }
    
    /// переменная имени сущности
    var name: String? {
        get {
            return route_number
        }
        set {
            //route_number = newValue
        }
    }
    
    /// функция расчет высоты в зависимости от ширины
    func heightAtWidth(_ width: CGFloat) -> CGFloat {
        return kSearchViewCellDefaultHeight
    }
}
