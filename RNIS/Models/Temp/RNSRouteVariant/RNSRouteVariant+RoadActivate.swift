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
        var buss = [RNSRoutePoint]()
        for index in (0..<(points.count)) {
            let point = points[index]
            buss.append(point)
            if point.type != .bus {
                roadActivate?.append(RNSRoadBus(buss))
                buss = [RNSRoutePoint]()
            }
        }
        roadActivate?.append(RNSRoadBus(buss))
    }
}
