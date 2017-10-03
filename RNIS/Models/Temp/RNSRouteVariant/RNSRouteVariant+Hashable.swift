//
//  RNSRouteVariant+Hashable.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteVariant: Hashable {
    
    static func ==(lhs: RNSRouteVariant, rhs: RNSRouteVariant) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func prepareHashValue() {
        var hashValue = Int(0)
        for point in points ?? [] {
            hashValue += point.hashValue
        }
        self.hashValue = hashValue
    }
}
