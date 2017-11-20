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
    
    override func prepareImage() {
        prepareIcon(RNSImageFactory.bus_icon)
        
        guard  let text = (self.item as? RNSBus)?.route_number else {
            return
        }
        DispatchQueue.global(qos: .background).async {
            let image = RNSImageFactory.imageBusAt(text, selected: false)
            Utils.mainQueue {
                 self.prepareIcon(image)
            }
        }
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
    }
    
    /// Обновление положения пина на карте
    func updateLocation() {
        guard let point = item?.point else {
            return
        }
      //  print("uuid",item?.uuid as Any)
       // print("point",point as Any)
        overlayItem.geoPoint = point
        populate()
    }
}
