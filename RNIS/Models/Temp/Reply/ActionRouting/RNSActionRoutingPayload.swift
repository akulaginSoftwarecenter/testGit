//
//  RNSActionRoutingPayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 Класс модели загрузки маршрута
 */
class RNSActionRoutingPayload<T: Mappable>: RNISMappableBase {

    /// массив моделей
    var items: [T]?
    
    /// Метод парсинга
    public override func mapping(map: Map) {
        items <- map["items"]
    }
}
