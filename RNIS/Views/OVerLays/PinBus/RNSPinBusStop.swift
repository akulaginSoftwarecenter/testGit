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
        
        item?.handlerCurrent = { [weak self] value in
            self?.prepareCurrent(value)
        }
    }
    
    override func prepareImage() {
        prepareCurrent()
    }
    
    func prepareCurrent(_ current: Bool = false) {
        let image = current ? RNSImageFactory.bus_stop_current : RNSImageFactory.bus_stop
        setBitmap(image, xOffset: 0, yOffset: 0, isPlain: false, sizeInMeters: 15)
    }
}
