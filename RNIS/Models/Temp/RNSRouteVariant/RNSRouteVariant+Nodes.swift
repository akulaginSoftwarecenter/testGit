//
//  RNSRouteVariant+Navels.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteVariant {
    
    func removeNodes() {
        removeBussPins()
        removeNavels()
        removeEndPoint()
    }
    
    func prepareNodes() {
        prepareBusNote()
        prepareNavels()
        prepareEndPoint()
    }
    
    func updateNodes() {
        removeNodes()
        prepareNodes()
    }
    
    func prepareNavels() {
        navels?.forEach{ RNSPinDuration($0) }
    }
    
    func removeNavels() {
        navels?.forEach{ $0.handlerRemove?() }
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
