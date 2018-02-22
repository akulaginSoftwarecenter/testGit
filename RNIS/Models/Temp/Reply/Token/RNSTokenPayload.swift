//
//  RNSTokenPayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//


import UIKit
import ObjectMapper

/**
 Класс парсера Payload
 */
class RNSTokenPayload: RNISMappableBase {
    
    var token: String?
    
    /// Метод парсинга
    public override func mapping(map: Map) {
        token <- map["token"]
    }
}
