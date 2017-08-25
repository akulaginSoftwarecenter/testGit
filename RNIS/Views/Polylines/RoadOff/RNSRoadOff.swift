//
//  RNSRoadOff.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRoadOff: PGPolyline {
    
    var points: [PGGeoPoint]?
    
    convenience init(_ points: [RNSRoutePoint]?) {
        self.init()
        
        self.points = points?.flatMap{$0.point}
        prepareLine()
    }
    
    func prepareLine() {
        setLineWidth(5)
        preparePoints()
    }
    
    func preparePoints() {
        guard let points = points else {
            return
        }
        addPoints(points, count: Int32(points.count), color: .color163)
    }
}
