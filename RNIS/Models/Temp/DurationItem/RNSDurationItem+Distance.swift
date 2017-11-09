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
            distance = currentDistance ?? distanceAll
        } else {
            distance = nil
        }
        updatePin()
    }
    
    func contains(_ pair: AliasPair?) -> Bool {
        return contains(pair?.first) && contains(pair?.last)
    }
    
    func contains(_ point: RNSRoutePoint?) -> Bool {
        guard let point = point,
            let routePoints = routePoints else {
            return false
        }
        return routePoints.contains(where: {
            $0 == point
        })
    }
    
    var currentDistance: CLLocationDistance? {
        guard var routePoints = routePoints,
            let pair = routePoints.pairNearPoints,
            let last = pair.last,
            let distanceToCurrent = last.distanceToCurrent,
            let index = routePoints.index(of: last) else {
            return nil
        }
        
        routePoints.removeFirst(index)
        return routePoints.distance + distanceToCurrent
    }
    
    var rateDistance: Double {
        guard let currentDistance = currentDistance,
            let distanceAll = distanceAll else {
            return 1
        }
        return currentDistance/distanceAll
    }
}
