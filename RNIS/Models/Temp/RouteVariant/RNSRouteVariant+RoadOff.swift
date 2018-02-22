//
//  RNSRouteVariant+Overlay.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с не активным маршрутом
 */
extension RNSRouteVariant {
    
    func removeRoadOff() {
        roadOff?.clear()
    }
    
    func prepareRoadOff() {
        removeAllRoad()
        roadOff = RNSRoadOff(points)
    }
}
