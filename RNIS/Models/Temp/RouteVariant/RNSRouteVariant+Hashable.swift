//
//  RNSRouteVariant+Hashable.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с протоколом Hashable
 */
extension RNSRouteVariant: Hashable {
    
    static func ==(lhs: RNSRouteVariant, rhs: RNSRouteVariant) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
