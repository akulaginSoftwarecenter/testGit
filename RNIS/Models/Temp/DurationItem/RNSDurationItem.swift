//
//  RNSDurationItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс длительности в маршруте
 */
class RNSDurationItem: NSObject {
    /// точка инициализации
    var point: PGGeoPoint?
    var durationMinute: Int?
    var durationDefault: Int?
    var distance: CLLocationDistance?
    var distanceAll: CLLocationDistance?
    
    var handlerRemove: EmptyBlock?
    var handlerUpdate: EmptyBlock?
    var handlerUpdateHide: EmptyBlock?
    var routePoints: [RNSRoutePoint]?
    
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
    
    var isHide: Bool = false {
        didSet {
            handlerUpdateHide?()
        }
    }
    
    /// Метод инициализации 
    convenience init(_ point: PGGeoPoint?, time: Int?, routePoints: [RNSRoutePoint]?) {
        self.init()
        
        self.point = point
        self.prepareTime(time)
        self.routePoints = routePoints
        self.distanceAll = routePoints?.distance
    }
    
    func updatePin() {
        handlerUpdate?()
    }
    
    func updateHide(_ hide: Bool) {
        if isHide != hide {
            isHide = hide
        }
    }
}
