//
//  RNSPinMyLocation.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPinMyLocation: RNSPinParent {
    
    var point: PGGeoPoint {
        return RNSLocationManager.point
    }
    
    override init() {
        super.init()

        setBitmap(#imageLiteral(resourceName: "ic_userLocation"), xOffset: 0, yOffset: 0, isPlain: false, sizeInMeters: 50)
        preparePoint(point)
        prepareHandlers()
    }
    
    func prepareHandlers() {
        RNSLocationManager.handlerMyLocation = { [weak self] in
            self?.updateLocation()
        }
    }
    
    func updateLocation() {
        overlayItem.geoPoint = point
        populate()
    }
}
