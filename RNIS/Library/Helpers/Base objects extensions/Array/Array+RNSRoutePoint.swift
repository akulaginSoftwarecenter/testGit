//
//  Array+RNSRoutePoint.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с RNSRoutePoint
 */
extension Array where Element: RNSRoutePoint {
    
    var navel: RNSDurationItem? {
        let center = distance/2
        var distanceAll = CLLocationDistance(0)
        let count = self.count - 1
        guard 0 < count else {
            return nil
        }
        for i in 0..<count {
            let item1 = valueAt(i)
            let item2 = valueAt(i + 1)
            let distance = item1?.distanceTo(item2) ?? 0
            if (distanceAll + distance) >= center {
                let edge = center - distanceAll
                let point1 = item1?.point
                let azimut = point1?.azimuth(item2?.point)
                let point = point1?.coordinate(azimut, distance: edge)
                return RNSDurationItem(point, time: self.time, routePoints: self)
            }
            distanceAll += distance
        }
        guard let first = first else {
            return nil
        }
        return RNSDurationItem(first.point, time: first.time, routePoints: [first])
    }
    
    var time: Int {
        var time = 0
        self.enumerateNonFirst {
             time += ($0?.time ?? 0)
        }
        return time
    }
    
    var distance: CLLocationDistance {
        var distance = CLLocationDistance(0)
        enumPoint {
            distance += $0?.distanceTo($1) ?? 0
        }
        return distance
    }
    
    func enumPoint(handler: ((RNSRoutePoint?,RNSRoutePoint?) -> ())?) {
        let count = self.count - 1
        guard 0 < count else {
            return
        }
        for i in 0..<count {
            handler?(valueAt(i),valueAt(i + 1))
        }
    }
    
    var nearPoint: RNSRoutePoint? {
        guard var nearPoint = first,
            var nearDistance = nearPoint.distanceToCurrent else {
                return nil
        }
        let lastIndex = count
        guard 1 <= lastIndex  else {
            return nil
        }
        
        for i in 1..<lastIndex {
            guard let point = valueAt(i),
                let toCurrent = point.distanceToCurrent else {
                continue
            }
            if  toCurrent < nearDistance {
                nearPoint = point
                nearDistance = toCurrent
            }
        }
        return nearPoint
    }
    
    var pairNearPoints: AliasPair? {
        guard let point = nearPoint,
            let item = point as? Element,
            let ind = self.index(of: item) else {
                return nil
        }
        let prevousPoint = valueAt(ind - 1)
        let nextPoint = valueAt(ind + 1)
        
        if checkContainsInPoints(point, pointCheck: nextPoint) {
            return (point, nextPoint)
        } else {
            return (prevousPoint, point)
        }
    }
    
    func checkContainsInPoints(_ point: RNSRoutePoint?, pointCheck: RNSRoutePoint?) -> Bool {
        if let pointCheck = pointCheck,
            let distanceToCurrent = pointCheck.distanceToCurrent,
            let between = pointCheck.distanceTo(point),
            distanceToCurrent < between {
            return true
        }
        return false
    }
}
