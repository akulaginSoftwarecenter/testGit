//
//  RNSRouteVariant+Parse.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteVariant {
    func prepareHashValue() {
        var hashValue = Int(0)
        for point in points ?? [] {
            hashValue += point.hashValue
        }
        self.hashValue = hashValue
    }
    
    func prepareCenterPoint() {
        let count = (points?.count ?? 0) / 2
        self.centerPoint = points?.valueAt(count)?.point
    }
}
