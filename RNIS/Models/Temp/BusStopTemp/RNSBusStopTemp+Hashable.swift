//
//  RNSBusStopTemp+Hashable.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusStopTemp: Hashable {
    
    var hashValue: Int {
        return uuid?.hashValue ?? 0
    }
   
    static func ==(lhs: RNSBusStopTemp, rhs: RNSBusStopTemp) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
