//
//  RNSPageRouteController+Route.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSPageRouteController {
    
    func prepareLines() {
        items?.first?.prepareRoadOff()
        items?.last?.prepareRoadActivate()
    }
    
    func removeAllRoute() {
        items?.forEach{$0.removeAllRoad()}
    }
}
