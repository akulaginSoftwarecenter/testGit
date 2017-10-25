//
//  RNSMapManager+Stub.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
/**
 Контоллер управления тенями карты
 */
extension RNSMapManager {
    
    /// Подготовка экземпляра теней карты
    static func prepareStub() {
        RNSBusStopManager.prepareStubBusStop()
        //prepareStubBus()
    }
    
    /// Подготовка экземпляра теней ТС
    static func prepareStubBus() {
        RNSDataManager.createStubBusIfNeed()
        guard let item = RNSDataManager.buss?.first else {
            return
        }
        item.handlerRemove?()
        _ = RNSPinBus(item)
    }
}
