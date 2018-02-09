//
//  RNSRabancItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.02.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSRabancItem: RNISMappableBase {

    var latitude: Double?
    var longitude: Double?
    
    var point: PGGeoPoint?
    
    public override func mapping(map: Map) {
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        preparePoint()
    }
    
    func preparePoint() {
        guard let latitude = latitude,
            let longitude = longitude else {
                return
        }
        point = PGGeoPoint(latitude: latitude, longitude: longitude)
    }
}