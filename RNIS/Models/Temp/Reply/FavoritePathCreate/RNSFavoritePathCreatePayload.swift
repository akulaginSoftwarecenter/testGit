//
//  RNSFavoritePathCreatePayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSFavoritePathCreatePayload: RNISMappableBase {
    
    var uuid: String?
    public override func mapping(map: Map) {
        
        uuid <- map["uuid"]
    }
}