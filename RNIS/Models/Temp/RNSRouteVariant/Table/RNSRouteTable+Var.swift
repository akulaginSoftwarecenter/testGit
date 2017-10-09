//
//  RNSRouteTable+Var.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteTable {
    
    var isLastStop: Bool {
        return lastItem?.isStopCell ?? false
    }
    
    var isLastStill: Bool {
        return lastItem?.isStillCell ?? false
    }
    
    var lastItem: RNSRouteTableItem? {
        return items.last
    }
      
    var isLastItemRun: Bool {
        return items.last?.isRun ?? false
    }
}
