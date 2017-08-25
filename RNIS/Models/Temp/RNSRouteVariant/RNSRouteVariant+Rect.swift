//
//  RNSRouteVariant+Rect.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import MapKit

extension RNSRouteVariant {
    
    var rects: [RNSRectPoint] {
        var rects = [RNSRectPoint]()
        for index in (0..<points.count-1) {
            let point = points.valueAt(index)?.point
            let point2 = points.valueAt(index + 1)?.point
            let rect = RNSRectPoint(point, pointEnd: point2)
            rects.append(rect)
        }
        return rects
    }
    
    func containts(_ point: PGGeoPoint?) -> Bool {
        for rect in rects {
            if rect.countains(point) {
                return true
            }
        }
        return false
    }
}
