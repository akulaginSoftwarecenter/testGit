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
        return CGFloat(45 + (forecast?.count ?? 0) * 49)
    }
    public override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.point = PGGeoPoint(latitude: latitude ?? 0, longitude: longitude ?? 0)
        self.nameDistance = self.point?.distanceToCurrent.toString
    }
    
    var point: PGGeoPoint?
    var nameDistance: String?
    
    func heightAtWidth(_ width: CGFloat) -> CGFloat {
        return kSearchViewCellDefaultHeight
    }
}
