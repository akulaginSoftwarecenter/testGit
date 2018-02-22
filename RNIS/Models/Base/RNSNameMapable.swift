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

    var uuid: String?
    var name: String?
    var latitude: Double?
    var longitude: Double?
    
    /// Метод парсинга
    public override func mapping(map: Map) {
        uuid <- map["uuid"]
        name <- map["name"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
}
