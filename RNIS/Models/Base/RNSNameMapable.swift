//
//  RNSNameMapable.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 RNSNameMapable
 */
class RNSNameMapable: RNISMappableBase {

    /// переменная уникальный идентификатор сущности
    var uuid: String?
    /// переменная имени сущности
    var name: String?
    /// переменная широта сущности
    var latitude: Double?
    /// переменная долгота сущности
    var longitude: Double?
    
    /// Метод парсинга
    public override func mapping(map: Map) {
        uuid <- map["uuid"]
        name <- map["name"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
}
