//
//  RNSPinVariantBus.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Пин маршрута автобуса
 */
class RNSPinVariantBus: RNSPinParent {
    
    /// Модель маршрута автобуса
    var bus: RNSBusRouteTemp?
    
    /// Создание пина
    ///
    /// - Parameter bus: модель маршрута автобуса
    @discardableResult convenience init(_ bus: RNSBusRouteTemp?) {
        self.init()
        
        self.bus = bus
        guard let bus = bus,
              let point = bus.point else {
            return
        }
        prepareIcon()
        preparePoint(point)
        prepareHandlers()
    }
    
    /// Привязка удаления маршрута к удалению пина
    func prepareHandlers() {
        bus?.handlerRemove = { [weak self] in
             self?.remove()
        }
    }
    
    func prepareIcon() {
        //Utils.queueUserBackground {
            let view = RNSNoteRoute(busTitle: self.bus?.title, type: .down)
            let image = view.asImage
          //  Utils.mainQueue {
                  self.setBitmap(image, xOffset: 0, yOffset: -1.0, isPlain: false, sizeInMeters: 50)
          //  }
       // }
    }
}
