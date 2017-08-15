//
//  RNSPinItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPinItem: PGOverlay {
    var item: RNSCoordinateModel?
    lazy var overlayItem = PGOverlayItem()
    
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
        items().add(overlayItem)
        addOnMap()
        overlayItem.geoPoint = point
        populate()
    }
    
    func addOnMap() {
        RNSMapManager.addOverlay(self)
    }
    
    func prepareHandlers() {
        item?.handlerRemove = {
            RNSMapManager.removeOverlay(self)
        }
    }
}
