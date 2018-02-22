//
//  RNSRoutePoint+Hashable.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с протоколом Hashable
 */
extension RNSRoutePoint: Hashable  {
   
    static func ==(lhs: RNSRoutePoint, rhs: RNSRoutePoint) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func prepareHashValue() {
        let latitude = Int((self.latitude ?? 1) * 1000000)
        let longitude = Int(self.longitude ?? 2 * 100000)
        self.hashValue = latitude + longitude
    }
}
