//
//  RNSRouteTableItem+Var.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteTableItem {
    
    var stillText: String? {
        if openStill {
            return text2
        } else {
            return "Еще \(countStill)"
        }
    }
    
    var isStill: Bool {
        return type == .still
    }
    
    var countStill: Int {
        return itemsStill.count
    }
    
    var isBus: Bool {
        return typeLine == .bus
    }
    
    var isStop: Bool {
        return type == .stop
    }
    
    var isRun: Bool {
        return typeLine == .run
    }
}
