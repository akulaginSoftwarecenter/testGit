//
//  RNSPinBus.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPinBusStop: PGOverlay {
    
    lazy var overlayItem = PGOverlayItem()
    
    var item: RNSBusStop?
    
    @discardableResult convenience init(_ item: RNSBusStop) {
        self.init()
        
        self.item = item
        setBitmap(#imageLiteral(resourceName: "Bus_stop"), xOffset: 0, yOffset: 0, isPlain: false, sizeInMeters: 50)
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
