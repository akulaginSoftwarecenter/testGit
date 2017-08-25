//
//  RNSRouteVariant+RoadActivate.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteVariant {
    
    func removeRoadActivate() {
        roadActivate?.forEach{$0.clear()}
    }
    
    func prepareRoadActivate() {
        removeRoadActivate()
        roadActivate = [PGPolyline]()
        prepareBusRoads()
    }
    
    func prepareBusRoads() {
        for index in (0..<(points.count-1)) {
            let point = points[index]
            guard point.type == .bus  else {
                continue
            }
            let array = [point, points[index + 1]]
            roadActivate?.append(RNSRoadBus(array))
        }
    }
}
