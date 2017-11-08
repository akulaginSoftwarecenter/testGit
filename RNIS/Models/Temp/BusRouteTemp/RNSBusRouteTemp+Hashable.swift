//
//  RNSBusRouteTemp+Hashable.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusRouteTemp: Hashable  {
    var hashValue: Int {
        return uuid?.hashValue ?? 0
    }
    
    static func ==(lhs: RNSBusRouteTemp, rhs: RNSBusRouteTemp) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
