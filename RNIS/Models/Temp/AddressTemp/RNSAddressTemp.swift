//
//  RNSAddressTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSAddressTemp: RNISMappableBase, RNSTextItem {
    
    var uuid: String?
    var name: String?
    var latitude: Double?
    var longitude: Double?
    var coord: [String]?
    
    public override func mapping(map: Map) {
        uuid <- map["id"]
        name <- map["entity"]
        coord <- map["coord"]
        latitude = Double(coord?.first ?? "")
        longitude = Double(coord?.last ?? "")
    }
}
