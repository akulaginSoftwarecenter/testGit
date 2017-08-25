//
//  RNSRouteVariant+Overlay.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteVariant {
    
    func removeRoadOff() {
        roadOff?.clear()
    }
    
    func prepareRoadOff() {
        removeRoadOff()
        roadOff = RNSRoadOff(points)
    }
}
