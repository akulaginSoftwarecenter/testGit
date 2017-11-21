//
//  RNSPinBus.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Пин автобуса
 */
class RNSPinBus: RNSPinItem {
    
    var widthTitle: CGFloat?
    var itemBus: RNSBus?
    
    override func prepareItem() {
        itemBus = item as? RNSBus
        widthTitle = itemBus?.widthTitle ?? 0
    }
    
    /// Установка иконки в оверлей
    ///
    /// - Parameter image: иконка
    func prepareIcon(_ image: UIImage) {
        setBitmap(image, xOffset: 0.00, yOffset: 0.0, isPlain: false, sizeInMeters: 15)
    }
    
    override func prepareHandlers() {
        super.prepareHandlers()
        item?.handlerUpdateLocaton = { [weak self] in
            self?.updateLocation()
        }
        
        item?.handlerUpdateIcon = { [weak self] in
            self?.updateImage()
        }
    }
    
    /// Обновление положения пина на карте
    func updateLocation() {
        guard let point = item?.point else {
            return
        }
        overlayItem.geoPoint = point
        populate()
    }
    
    override func prepareImage() {
        prepareIcon(RNSImageFactory.bus_icon)
        updateImage()
    }

}
