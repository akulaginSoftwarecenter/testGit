//
//  RNSDurationItem+Distance.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSDurationItem {
    
    func updateDistance() {
        if showDistance {
            distance = routePoints?.last??.point?.distanceToCurrent
        } else {
            distance = nil
        }
        handlerUpdate?()
    }
    /*
    func contains(_ pair: AliasPair?) -> Bool {
        //if
    }
    
    func contains(_ point: RNSRoutePoint?) -> Bool {
        guard let point = point,
            let routePoints = routePoints else {
            return false
        }
        return routePoints.contains(point)
    }
     */
}
