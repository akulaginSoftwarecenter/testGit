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
        prepareBusActivate()
        prepareRunActivate()
    }
    
    func prepareBusActivate() {
        prepareRoadActivate(.bus) { points in
            return RNSRoadBus(points)
        }
    }
    
    func prepareRunActivate() {
        prepareRoadActivate(.run) { points in
            return RNSRoadRun(points)
        }
    }

    func prepareRoadActivate(_ type: TypePoint?, handlerPolyline: (([RNSRoutePoint]?) -> (PGPolyline))?) {
        guard let type = type else {
            return
        }
        
        var items = [RNSRoutePoint]()
        let addDraw: (([RNSRoutePoint]) -> ()) = {[weak self] items in
            guard items.count > 1,
                let polyline = handlerPolyline?(items) else {
                return
            }
            self?.roadActivate?.append(polyline)
        }
        
        for index in (0..<(points.count)) {
            let point = points[index]
            items.append(point)
            if point.type != type {
                addDraw(items)
                items = [RNSRoutePoint]()
            }
        }
        addDraw(items)
    }
}
