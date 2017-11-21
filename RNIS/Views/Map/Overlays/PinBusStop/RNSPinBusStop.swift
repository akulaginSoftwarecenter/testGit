//
//  RNSPinBus.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Пин автобусной остановки
 */
class RNSPinBusStop: RNSPinItem {
    
    override func prepareHandlers() {
        super.prepareHandlers()
        
        item?.handlerUpdateIcon = { [weak self] in
            self?.updateIcon()
        }
    }
    
    override func prepareImage() {
        updateIcon()
    }
    
    var defaultIcon: UIImage {
        return RNSBusStopManager.isZoomSmallStop ? RNSImageFactory.bus_stopSmall : RNSImageFactory.bus_stop
    }
   
    /// Настройка иконки пина
    func updateIcon() {
        let current = item?.isCurrent ?? false
        let image = current ? RNSImageFactory.bus_stop_current : defaultIcon
        guard imageSetuped != image else {
            return
        }
        imageSetuped = image
        setBitmap(image, xOffset: 0, yOffset: 0, isPlain: false, sizeInMeters: 15)
    }
}
