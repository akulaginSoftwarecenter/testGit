//
//  RNSPinBus.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPinBusStop: RNSPinItem {
    
    override func prepareHandlers() {
        super.prepareHandlers()
        
        item?.handlerCurrent = { [weak self] in
            self?.prepareCurrent()
        }
    }
    
    override func prepareImage() {
        prepareCurrent()
    }
    
    func prepareCurrent() {
        let current = item?.uuid == RNSBusStopManager.currentStopUuid
        let image = current ? RNSImageFactory.bus_stop_current : RNSImageFactory.bus_stop
        setBitmap(image, xOffset: 0, yOffset: 0, isPlain: false, sizeInMeters: 15)
    }
}
