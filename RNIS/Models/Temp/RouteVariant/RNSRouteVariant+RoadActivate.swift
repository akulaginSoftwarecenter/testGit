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
        removeNodes()
        roadActivate?.forEach{$0.clear()}
    }
    
    func removeRoadRun() {
        roadActivate?.forEach{($0 as? RNSRoadRun )?.clear()}
    }
    
    var getZoomLevel: Int {
        return RNSMapManager.getZoomLevel
    }
    
    func prepareRoadActivateAtZoom() {
        if  let currentZoom = currentZoom,
            getZoomLevel == currentZoom {
            return 
        }
        currentZoom = getZoomLevel
        removeRoadRun()
        prepareRunActivate()
    }
    
    func prepareRoadActivate() {
        removeAllRoad()
        roadActivate = [PGPolyline]()
        prepareRunActivate()
        prepareBusActivate()
        prepareNodes()
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
        
        let addDraw: (([RNSRoutePoint]) -> ()) = {[weak self] items in
            guard items.count > 1,
                let polyline = handlerPolyline?(items) else {
                return
            }
            self?.roadActivate?.append(polyline)
        }
        
        guard let points = points else {
            return
        }
        var lastType = TypePoint.run
        var items = [RNSRoutePoint]()
        for index in (0..<(points.count)) {
            let point = points[index]
            if let pointType = point.type {
                lastType = pointType
            }
            items.append(point)
            if lastType != type {
                addDraw(items)
                items = [RNSRoutePoint]()
            }
        }
        if lastType == type {
            addDraw(items)
        }
    }
}
