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
        
        let addDrawBuss: (([RNSRoutePoint]) -> ()) = {[weak self] buss in
            self?.roadActivate?.append(RNSRoadBus(buss))
        }
        
        for index in (0..<(points.count)) {
            let point = points[index]
            buss.append(point)
            if point.type != .bus {
                addDrawBuss(buss)
                buss = [RNSRoutePoint]()
            }
        }
        addDrawBuss(buss)
    }
}
