//
//  RNSStopRegionManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import MapKit

class RNSStopRegionManager: NSObject {
    static var regions = [MKMapRect]()
    
    static func checkCurrentRect(сontinue: EmptyBlock?, failure: EmptyBlock?) {
        guard let rect = currentMapRect else {
            return
        }
        print("checkCurrentRect",regions.count)
        for item in self.regions {
            if item.contains(rect) {
                print("current finded")
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
        
        print("add1",regions.count)
        print("rect",rect)
        print("MaxX",MKMapRectGetMaxX(rect))
        print("MaxY",MKMapRectGetMaxY(rect))
        regions = regions.filter({
            return !$0.contains(rect)
        })
        regions.append(rect)
        print("add2",regions.count)
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
        print("topLeft",topLeft)
        print("topLeft",topLeft)
        return MKMapRect(coordinates: [topLeft,downRight])
    }
}
