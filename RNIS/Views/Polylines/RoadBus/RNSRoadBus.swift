//
//  RNSRoadBus.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRoadBus: PGPolyline {
    var points: [PGGeoPoint]?
    
    convenience init(_ points: [RNSRoutePoint]?) {
        self.init()
        
        self.points = points?.flatMap{$0.point}
        prepareLine()
    }
    
    func prepareLine() {
        setBorderWidth(50)
        setLineWidth(5)
        setOutlineColor(.color13)
        setBorderWidth(1)
        preparePoints()
    }
    
    func preparePoints() {
        guard let points = points else {
            return
        }
        addPoints(points, count: Int32(points.count), color: .color34)
    }
}
