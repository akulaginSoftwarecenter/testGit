//
//  RNSTokenPayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//


import UIKit
import ObjectMapper

class RNSTokenPayload: Mappable {
    
    var token: String?
    
    required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        token <- map["token"]
    }
}
