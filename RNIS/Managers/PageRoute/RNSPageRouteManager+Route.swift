//
//  RNSPageRouteManager+Route.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSPageRouteManager {
    
    static func activeRoadReload() {
        currentItem?.prepareRoadActivateAtZoom()
    }
    
    static func removeAllRoute() {
        items?.forEach{$0.removeAllRoad()}
    }
    
    
    static func removeNonActivRoute() {
        routeNonActive?.forEach {$0.removeAllRoad() }
    }
    
    static func checkContaints(_ point: PGGeoPoint?){
        for item in items ?? [] {
            if item.containts(point) {
                updateAll(item)
                break
            }
        }
    }
    
    static func prepareRoadsOff() {
        let offRoutes = self.items?.filter{ !$0.isActive }
        offRoutes?.forEach{$0.prepareRoadOff()}
    }
    
    static var routeNonActive: [RNSRouteVariant]? {
        return items?.filter{ $0 !=  self.currentItem}
    }
}
