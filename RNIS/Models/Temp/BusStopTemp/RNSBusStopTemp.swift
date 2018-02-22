//
//  RNSBusStopTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSBusStopTemp: RNSNameMapable, RNSTextItem {
   
    var forecast: [RNSRouteBusTemp]?
    
    var height: CGFloat {
        var count: CGFloat = 0
        if let forcount = forecast?.count {
            count = CGFloat(forcount)
        }
        return 45 + count * 49
    }
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.point = PGGeoPoint(latitude: latitude ?? 0, longitude: longitude ?? 0)
        distance_to_user <- map["distance_to_user"]
        self.nameDistance = self.distance_to_user?.toString
    }
    
    var point: PGGeoPoint?
    var nameDistance: String?
    var distance_to_user: CLLocationDistance?
    
    func heightAtWidth(_ width: CGFloat) -> CGFloat {
        return kSearchViewCellDefaultHeight
    }
}
