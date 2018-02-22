//
//  RNSRouteVariant+Navels.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с надписями
 */
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
            removeDistanceNavel()
        }
    }
    
    func removeDistanceNavel() {
        navels?.forEach { $0.updateCurrent = false }
        navels?.forEach { $0.updateHide(false) }
    }
    
    func showDistanceNavelIfNeed() {
        guard let pair = points?.pairNearPoints,
            let navels = navels else {
            return
        }
        var finded = false
        var currentItem: RNSDurationItem?
        for navel in navels {
            if navel.contains(pair) {
                finded = true
                currentItem = navel
            } else {
                navel.updateCurrent = false
            }
        }
        
        if !finded {
            currentItem = navels.first
        }
        
        currentItem?.updateCurrent = true
        updateHideNavelsIfNeed(currentItem)
    }
    
    func updateHideNavelsIfNeed(_ currentItem: RNSDurationItem?) {
        var finded = false
        navels?.forEach({
            if $0 == currentItem {
                finded = true
            }
            $0.updateHide(!finded)
        })
    }
}
