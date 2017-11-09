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
        navels?.forEach { $0.updateCurrent = false }
    }
    
    func showDistanceNavelIfNeed() {
        guard let pair = points?.pairNearPoints,
            let navels = navels else {
            return
        }
        var finded = false
        
        for navel in navels {
            if navel.contains(pair) {
                finded = true
                navel.updateCurrent = true
            } else {
                navel.updateCurrent = false
            }
        }
        
        if !finded {
            navels.first?.updateCurrent = true
        }
    }
}
