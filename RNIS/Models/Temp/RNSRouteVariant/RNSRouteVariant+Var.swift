//
//  RNSRouteVariant+Var.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteVariant {
    
    var buss: [RNSBusRouteTemp] {
        var buss = [RNSBusRouteTemp]()
        for point in points ?? [] {
            if point.doneMove {
                buss.last?.doneMove = true
            }
            guard let bus = point.route else {
                continue
            }
            if !buss.contains(bus) {
                buss.append(bus)

            }
        }
        return buss
    }
    
    var isActive: Bool {
        return self == RNSPageRouteManager.currentItem
    }
     
    var tableItem: RNSRouteTable {
        return RNSRouteTable(self)
    }
    
    var heightDotsVerticalModel: CGFloat {
        return dotsVerticalModel.height
    }
    
    var isFavorite: Bool {
        return uuid != nil
    }
}
