//
//  RNSPinDuration.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Pin Duration
 */

class RNSPinDuration: RNSPinParent {
    var item: RNSDurationItem?
    
    @discardableResult convenience init(_ item: RNSDurationItem?) {
        self.init()
        
        self.item = item
        guard let item = item,
            let point = item.point else {
                return
        }
        updateIcon()
        preparePoint(point)
        prepareHandlers()
    }
    
    func prepareHandlers() {
        item?.handlerRemove = { [weak self] in
            self?.remove()
        }
        
        item?.handlerUpdate = { [weak self] in
            self?.updateIcon()
        }
    }
    
    func updateIcon() {
        let view = RNSNoteRoute(durationMinute: item?.durationMinute, distance: item?.distance, type: .up)
        setBitmap(view.asImage, xOffset: 0, yOffset: 1.0, isPlain: false, sizeInMeters: 50)
    }
}
