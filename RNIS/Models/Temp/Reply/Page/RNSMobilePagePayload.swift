//
//  RNSMobilePagePayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSMobilePagePayload: RNISMappableBase {
    var uuid: String?
    var key: String?
    var text: String?
    
    public override func mapping(map: Map) {
        uuid <- map["uuid"]
        key <- map["key"]
        text <- map["text"]
    }
}