//
//  RNSPinMyLocation.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Пин пользователя
 */
class RNSPinMyLocation: RNSPinParent {

    /// Создание пина
    override init() {
        super.init()

        setBitmap(#imageLiteral(resourceName: "ic_userLocation"), xOffset: 0, yOffset: 0, isPlain: false, sizeInMeters: 50)
        preparePoint(RNSLocationManager.point)
    }
    
    func updateLocation(_ point: PGGeoPoint?) {
        guard let point = point else {
            return
        }
        overlayItem.geoPoint = point
        populate()
    }
}
