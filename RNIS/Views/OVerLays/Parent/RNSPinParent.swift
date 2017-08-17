//
//  RNSPinParent.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPinParent: PGOverlay {
    
    lazy var overlayItem = PGOverlayItem()
    
    func preparePoint(_ point: PGGeoPoint) {
        items().add(overlayItem)
        addOnMap()
        overlayItem.geoPoint = point
        populate()
    }
    
    func addOnMap() {
        RNSMapManager.addOverlay(self)
    }
    
    func remove() {
        RNSMapManager.removeOverlay(self)
    }
}
