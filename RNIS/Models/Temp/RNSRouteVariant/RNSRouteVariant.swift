//
//  RNSRouteVariant.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteVariant: RNISMappableBase {
    
    var durationMinute: Int?
    var endDate: Date?
    
    var buss: [RNSBusTemp]?
    
    static var generate: RNSRouteVariant {
        let item = RNSRouteVariant()
        var buss = [RNSBusTemp]()
        let durationMinute = Int.rand(1, limit: 40)
        item.durationMinute = durationMinute
        item.endDate = Date().appendMinute(durationMinute)
        
        for _ in (1...Int.rand(1, limit: 4)) {
            buss.append(RNSBusTemp.generate)
        }
        
        item.buss = buss
        return item
    }
    
    var titleWidthBuss: CGFloat {
        var width = CGFloat(0)
        for item in buss ?? [] {
            width += item.titleWidth
        }
        return width
    }
}
