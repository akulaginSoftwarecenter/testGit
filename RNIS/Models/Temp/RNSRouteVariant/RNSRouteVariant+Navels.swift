//
//  RNSRouteVariant+Navels.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteVariant {
    
    func prepareNavels() {
        navels?.forEach{ RNSPinDuration($0) }
    }
    
    func removeNavels() {
        navels?.forEach{ $0.handlerRemove?() }
    }
    
    func updateDistanceNavels() {
        if showDistanceNavels {
            showDistanceNavelIfNeed()
        } else {
            hideDistanceNavel()
        }
    }
    
    func hideDistanceNavel() {
        navels?.forEach { $0.showDistance = false }
    }
    
    func showDistanceNavelIfNeed() {
        navels?.forEach { $0.showDistance = true }
    }
}
