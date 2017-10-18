//
//  RNSPinItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Pin Item
 */

class RNSPinItem: RNSPinParent {
    var item: RNSCoordinateModel?
    
    @discardableResult required init(_ item: RNSCoordinateModel) {
        super.init()
   
        self.item = item
        preparePoint()
        prepareImage()
        prepareHandlers()
    }
    
    func prepareImage() {
        
    }
    
    func preparePoint() {
        guard let point = item?.point else {
            return
        }
        preparePoint(point)
    }
    
    func prepareHandlers() {
        item?.handlerRemove = { [weak self] in
            self?.remove()
        }
    }
}
