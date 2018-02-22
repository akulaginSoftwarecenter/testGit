//
//  RNSRouteTableItem+Var.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с переменными
 */
extension RNSRouteTableItem {
    
    var stillText: String? {
        if openStill {
            return text2
        } else {
            return "Еще \(countStill)"
        }
    }
    
    var isStillCell: Bool {
        return type == .still
    }
    
    var isBusCell: Bool {
        return type == .bus
    }
    
    var isStopCell: Bool {
        return type == .stop
    }
    
    var countStill: Int {
        return itemsStill.count
    }
    
    var isBusLine: Bool {
        return typeLine == .bus
    }
    
    var isRun: Bool {
        return typeLine == .run
    }
    
    var lastStillDoneMove: Bool {
        return itemsStill.last?.doneMove ?? false
    }
}
