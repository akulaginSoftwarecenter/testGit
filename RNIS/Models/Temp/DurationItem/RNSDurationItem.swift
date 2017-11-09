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
    var durationDefault: Int?
    var distance: CLLocationDistance?
    var distanceAll: CLLocationDistance?
    
    var handlerRemove: EmptyBlock?
    var handlerUpdate: EmptyBlock?
    var routePoints: [RNSRoutePoint]?
    
    convenience init(_ point: PGGeoPoint?, time: Int?, routePoints: [RNSRoutePoint]?) {
        self.init()
        
        self.point = point
        self.prepareTime(time)
        self.routePoints = routePoints
        self.distanceAll = routePoints?.distance
    }
    
    var updateCurrent: Bool = false {
        didSet {
            showDistance = updateCurrent
            updateCurrentTime = updateCurrent
        }
    }
    
    var showDistance: Bool = false {
        didSet {
            updateDistance()
        }
    }
    
    var updateCurrentTime: Bool = false {
        didSet {
            if updateCurrentTime {
                updateTimeCurrent()
            } else {
                updateTimeDefault()
            }
        }
    }
    
    func updatePin() {
        handlerUpdate?()
    }
}
