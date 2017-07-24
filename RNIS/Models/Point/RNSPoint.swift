//
//  RNSPoint.swift
//  RNIS
//
//  Created by Артем Кулагин on 24.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSPoint: RNISMappableBase {
    
    var items: Any?
    
    public override func mapping(map: Map) {
        //payload <- map["payload"]
    }
}
