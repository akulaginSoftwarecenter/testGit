//
//  RNSContactPayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 Класс контакта
 */
class RNSContactPayload: RNISMappableBase {
    
    /// массив моделей
    var items: [RNSContactItem]?
    
    /// Метод парсинга
    public override func mapping(map: Map) {
        items <- map["items"]
    }
}
