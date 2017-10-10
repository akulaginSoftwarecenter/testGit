//
//  Array+RNSRoutePoint.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension Array where Element: RNSRoutePoint {
    
    var navel: RNSDurationItem? {
        let center = distance/2
        var distanceAll = CLLocationDistance(0)
        let time = first?.time
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
                return RNSDurationItem(point, time: time)
            }
            distanceAll += distance
        }
        return RNSDurationItem(first?.point, time: time)
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
        
        for point in self {
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
    
    var pairNearPoints: AliasPair? {
        guard let point = nearPoint,
            let item = point as? Element,
            let ind = self.index(of: item) else {
                return nil
        }
        
        
        let prevousPoint = valueAt(ind - 1)
        let nextPoint = valueAt(ind + 1)
        return (point,nextPoint)
        /*
        let prevousDistance = prevousPoint?.distanceToCurrent
        let nextDistance = nextPoint?.distanceToCurrent
        
        let prevousTuple: AliasPair = (prevousPoint, point)
        let nextTuple: AliasPair = (point, nextPoint)
        
        if let prevousDistance = prevousDistance,
            let nextDistance = nextDistance {
            if prevousDistance > nextDistance {
                return prevousTuple
            } else {
                return nextTuple
            }
        }
        
        if prevousDistance != nil {
            return prevousTuple
        }
        
        if nextDistance != nil {
            return nextTuple
        }
        
        return nil
         */
    }
}
