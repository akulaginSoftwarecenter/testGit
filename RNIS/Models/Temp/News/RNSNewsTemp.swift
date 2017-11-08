//
//  RNSNewsTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

import ObjectMapper

class RNSNewsTemp: RNISMappableBase {
    
    var uuid: String?
    var title: String?
    var image: String?
    var text: String?
    var timestamp: String?
    var is_active: Bool?
    var is_pinned: Bool?
    var anounce: String?
    
    override func mapping(map: Map) {
        uuid <- map["uuid"]
        title <- map["title"]
        image <- map["image"]
        text <- map["text"]
        timestamp <- map["timestamp"]
        is_active <- map["is_active"]
        is_pinned <- map["is_pinned"]
        anounce <- map["anounce"]
    }
}
