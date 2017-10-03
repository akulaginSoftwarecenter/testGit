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
        for i in 0..<(self.count - 1) {
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
        for i in 0..<(self.count - 1) {
            handler?(valueAt(i),valueAt(i + 1))
        }
    }
}
