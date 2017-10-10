//
//  RNSRouteTable+Var.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteTable {
    
    var isLastStop: Bool {
        return lastItem?.isStopCell ?? false
    }
    
    var isLastStill: Bool {
        return lastItem?.isStillCell ?? false
    }
    
    var lastItem: RNSRouteTableItem? {
        return items.last
    }
      
    var isLastItemRun: Bool {
        return items.last?.isRun ?? false
    }
    
    var nearPoint: RNSRoutePoint? {
        guard let points = points,
            var nearPoint = points.first,
            var nearDistance = nearPoint.distanceToCurrent else {
                return nil
        }
        
        for point in points {
            guard let toCurrent = point.distanceToCurrent  else {
                continue
            }
            if  toCurrent < nearDistance {
                nearPoint = point
                nearDistance = toCurrent
            }
        }
        return nearPoint
    }
    /*
    var pairNearPoints: (RNSRoutePoint?, RNSRoutePoint?)? {
        guard let point = nearPoint,
            let ind = points?.index(of: point) else {
                return nil
        }
        let previousInd = ind - 1
        let nextInd = ind + 1
        let prevousPoint = pointIndex(previousInd)
        let nextPoint = pointIndex(nextInd)
        let prevousDistance = prevousPoint?.distanceToCurrent
        let nextDistance = nextPoint?.distanceToCurrent
        
        if let prevousDistance = prevousDistance, let nextDistance = nextDistance {
            return (prevousDistance > nextDistance) ? (prevousPoint, point) : (point, nextDistance)
        }
        return nil
    }
    */
    func pointIndex(_ index: Int?) -> RNSRoutePoint? {
        return points?.valueAt(index)
    }

}
