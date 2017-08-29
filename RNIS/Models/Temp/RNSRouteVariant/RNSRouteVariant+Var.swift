//
//  RNSRouteVariant+Var.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteVariant {
    
    var buss: [RNSBusTemp] {
        let buss = points.flatMap{$0.bus}
        return buss.unique
    }
    
    var busStops: [RNSBusStop] {
        let stops = points.flatMap{$0.busStop}
        return stops.unique
    }
    
    var titleWidthBuss: CGFloat {
        var width = CGFloat(0)
        for item in buss {
            width += item.titleWidth
        }
        return width
    }
    
    var isActive: Bool {
        return self == RNSPageRouteManager.currentItem
    }
}
