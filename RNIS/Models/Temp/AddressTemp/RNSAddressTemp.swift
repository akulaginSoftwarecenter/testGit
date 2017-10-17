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
    var type: Int?
    
    public override func mapping(map: Map) {
        uuid <- map["id"]
        name <- map["entity"]
        coord <- map["coord"]
        type <- map["type"]
        longitude = Double(coord?.first ?? "")
        latitude = Double(coord?.last ?? "")
    }
    
    var isHouse: Bool {
        return (type ?? -1) == 3
    }
    
    var point: PGGeoPoint? {
        guard let latitude = latitude,
            let longitude = longitude else {
                return nil
        }
        return PGGeoPoint(latitude: latitude, longitude: longitude)
    }
}
