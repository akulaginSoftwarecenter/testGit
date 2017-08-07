//
//  RNSPinBuild.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPinBuild: PGOverlay {
    
    @discardableResult convenience init(_ point: PGGeoPoint) {
        self.init()
        
        setBitmap(#imageLiteral(resourceName: "PinBuild"), xOffset: 0, yOffset: 0, isPlain: false, sizeInMeters: 50)
        items().add(overlayItem)
        preparePoint(point)
        prepareHandlers()
    }
    
    lazy var overlayItem = PGOverlayItem()
     
    func preparePoint(_ point: PGGeoPoint) {
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
    
    func prepareHandlers() {
        RNSMapManager.removeOldPinBuild()
        RNSMapManager.handlerRemovePinBuild = {[weak self] (player) in
             self?.remove()
        }
    }
}
