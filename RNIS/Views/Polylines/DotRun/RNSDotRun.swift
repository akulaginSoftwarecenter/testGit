//
//  RNSDotRun.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Dot Run
 */

class RNSDotRun: PGPolyline {
    var point: PGGeoPoint?
    
    convenience init(_ point: PGGeoPoint?) {
        self.init()
        
        self.point = point
        prepareLine()
    }
    
    func prepareLine() {
        setLineWidth(4)
        setOutlineColor(.color13)
        setBorderWidth(1)
        preparePoint()
    }
    
    func preparePoint() {
        guard let point = point else {
            return
        }
        let tempPoint = PGGeoPoint(latitude: point.latitude, longitude: point.longitude + 0.00001)
        let points = [point, tempPoint]
        addPoints(points, count: Int32(points.count), color: .color34)
    }
}
