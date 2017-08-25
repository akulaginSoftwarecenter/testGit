//
//  RNSPageRouteController+Route.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSPageRouteController {
    
    var activeRoad: RNSRouteVariant? {
        return items?.last
    }
    
    func prepareLines() {
        items?.first?.prepareRoadOff()
        activeRoadReload()
    }
    
    func activeRoadReload() {
        activeRoad?.prepareRoadActivate()
    }
    
    func removeAllRoute() {
        items?.forEach{$0.removeAllRoad()}
    }
    
    func checkContaints(_ point: PGGeoPoint?){
        for item in items ?? [] {
            if item.containts(point) {
                print("----------------------------")
                print("checkContaints",item)
                break
            }
        }
    }
}
