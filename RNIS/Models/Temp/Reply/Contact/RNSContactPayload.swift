//
//  RNSContactPayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSContactPayload: RNISMappableBase {
    
    var items: [RNSContactItem]?
    
    public override func mapping(map: Map) {
        items <- map["items"]
    }
}