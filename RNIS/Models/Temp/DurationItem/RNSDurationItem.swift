//
//  RNSDurationItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSDurationItem: NSObject {
    var point: PGGeoPoint?
    var durationMinute: Int?
    var distance: CLLocationDistance?
    
    var handlerRemove: EmptyBlock?
    var handlerUpdate: EmptyBlock?
    var routePoints: [RNSRoutePoint?]?
    
    convenience init(_ point: PGGeoPoint?, time: Int?, distance: CLLocationDistance? = nil, routePoints: [RNSRoutePoint?]?) {
        self.init()
        
        self.point = point
        self.durationMinute = time
        self.distance = distance
        self.routePoints = routePoints
    }
}
