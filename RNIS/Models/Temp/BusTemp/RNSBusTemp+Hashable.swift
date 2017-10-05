//
//  RNSBusTemp+Hashable.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusTemp: Hashable {

    var hashValue: Int {
        return uuid?.hashValue ?? 0
    }
    
    static func ==(lhs: RNSBusTemp, rhs: RNSBusTemp) -> Bool {
        return lhs.title == rhs.title
    }
}
