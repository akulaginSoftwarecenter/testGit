//
//  RNSStopRegionManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import MapKit

/**
 Менеджер регионов для остановок
 */
class RNSStopRegionManager: NSObject {
   
    static var regions = [MKMapRect]()
    
    static func reset() {
        regions = [MKMapRect]()
    }
    
    static func checkCurrentRect(сontinue: EmptyBlock?, failure: EmptyBlock?) {
        guard let rect = currentMapRect else {
            return
        }
        for item in self.regions {
            if item.contains(rect) {
                failure?()
                return
            }
        }
        сontinue?()
    }
    
    static func add(_ min: PGGeoPoint?, center: PGGeoPoint?, complete: EmptyBlock?) {
        guard let rect = mapRect(min, center: center) else {
            complete?()
            return
        }
        regions = regions.filter({
            return !rect.contains($0)
        })
        regions.append(rect)
        complete?()
    }
    
    static var currentMapRect: MKMapRect? {
        return mapRect(RNSMapManager.lastMinCoord, center: RNSMapManager.lastCenterCoord)
    }
    
    static func mapRect(_ min: PGGeoPoint?, center: PGGeoPoint?) -> MKMapRect? {
        guard let distance = min?.distanceTo(center),
            let topLeft = center?.coordinate(315, distance: distance),
            let downRight = center?.coordinate(135, distance: distance) else {
            return nil
        }
        return MKMapRect(coordinates: [topLeft,downRight])
    }
}
