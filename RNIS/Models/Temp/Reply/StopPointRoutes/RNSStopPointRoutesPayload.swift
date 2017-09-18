//
//  RNSStopPointRoutesPayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSStopPointRoutesPayload: RNISMappableBase {
    var items: [RNSBusRouteTemp]?
    
    public override func mapping(map: Map) {
        items <- map["items"]
    }
}
