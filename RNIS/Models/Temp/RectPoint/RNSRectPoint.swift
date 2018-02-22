//
//  RNSRectPoint.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRectPoint {
    
    var pointStart: PGGeoPoint?
    var pointEnd: PGGeoPoint?
    
    var azimut: Double?
    
    var leftUp: PGGeoPoint?
    var leftDown: PGGeoPoint?
    
    var rightUp: PGGeoPoint?
    var rightDown: PGGeoPoint?
    
    var originalSpace: Double?
    
    var searchPoint: PGGeoPoint?
    
    var step: Double {
        return RNSMapManager.step
    }
    
    /// Метод инициализации 
    init(_ pointStart: PGGeoPoint?, pointEnd: PGGeoPoint?) {
        self.pointStart = pointStart
        self.pointEnd = pointEnd
        
        self.azimut = pointStart?.azimuth(pointEnd)
        self.preparePoints()
        self.prepareSpace()
    }
}
