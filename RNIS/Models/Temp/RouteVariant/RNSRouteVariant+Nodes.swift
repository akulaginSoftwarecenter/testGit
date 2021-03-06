//
//  RNSRouteVariant+Navels.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с нодами
 */
extension RNSRouteVariant {
    
    func removeNodes() {
        removeBussPins()
        removeNavels()
        removeEndPoint()
    }
    
    func prepareNodes() {
        prepareNavels()
        prepareBusNote()
        prepareEndPoint()
    }
    
    func updateNodes() {
        removeNodes()
        prepareNodes()
    }
     
    func prepareBusNote() {
        buss.forEach{ RNSPinVariantBus($0) }
    }
    
    func removeBussPins() {
        buss.forEach{ $0.handlerRemove?() }
    }
    
    func prepareEndPoint() {
        RNSPinVariantEnd(endPoint)
    }
    
    func removeEndPoint() {
        endPoint?.removeVariantEnd?()
    }
}
