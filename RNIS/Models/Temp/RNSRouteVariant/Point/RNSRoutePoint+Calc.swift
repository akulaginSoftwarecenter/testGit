//
//  RNSRoutePoint+Calc.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRoutePoint {
    
    func different(_ point: RNSRoutePoint?) -> Bool {
        guard let point = point else {
             return false
        }
        
        if  let selfRoute = route,
            let pointRoute = point.route,
            selfRoute != pointRoute {
            return true
        }
        
        if let pointType = point.type,
            let selfType = self.type,
            selfType != pointType {
            return true
        }
        
        return false
    }
    
    func distanceTo(_ point: RNSRoutePoint?) -> CLLocationDistance? {
        return self.point?.distanceTo(point?.point)
    }
    
    var isRun: Bool {
        guard let type = type else {
            return false
        }
        return type == .run
    }
    
    var isBus: Bool {
        guard let type = type else {
            return false
        }
        return type == .bus
    }
    
    var isHaveBus: Bool {
        return route != nil
    }
    
    var verticalTableItem: RNSVerticalTableItem {
        return RNSVerticalTableItem(self)
    }
    
    var distanceToCurrent: CLLocationDistance? {
        return point?.distanceToCurrent
    }
}
