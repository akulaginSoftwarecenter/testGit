//
//  RNSPinBus.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPinBus: PGOverlay {
    lazy var overlayItem = PGOverlayItem()
    
    var item: RNSBus?
    
    @discardableResult convenience init(_ item: RNSBus) {
        self.init()
        
        self.item = item
        let image = RNSImageFactory.imageBus(item)
        setBitmap(image, xOffset: 0.37, yOffset: -0.85, isPlain: false, sizeInMeters: 15)
        items().add(overlayItem)
        preparePoint(item.point)
    }
    
    func preparePoint(_ point: PGGeoPoint) {
        addOnMap()
        overlayItem.geoPoint = point
        populate()
    }
    
    func addOnMap() {
        RNSMapManager.addOverlay(self)
    }
}
