//
//  RNSPinVariantBus.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPinVariantBus: RNSPinParent {
    
    var bus: RNSBusTemp?
    
    @discardableResult convenience init(_ bus: RNSBusTemp?) {
        self.init()
        
        self.bus = bus
        guard let bus = bus,
              let point = bus.point else {
            return
        }
        let view = RNSNoteRoute(busTitle: bus.title, type: .down)
        setBitmap(view.asImage, xOffset: 0, yOffset: -1.0, isPlain: false, sizeInMeters: 50)
        preparePoint(point)
        prepareHandlers()
    }
    
    func prepareHandlers() {
        bus?.handlerRemove = { [weak self] in
             self?.remove()
        }
    }
}
