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
    
    /// Географические координаты пина
    var point: PGGeoPoint {
        return RNSLocationManager.point
    }
    
    /// Создание пина
    override init() {
        super.init()

        setBitmap(#imageLiteral(resourceName: "ic_userLocation"), xOffset: 0, yOffset: 0, isPlain: false, sizeInMeters: 50)
        preparePoint(point)
        prepareHandlers()
    }
    
    /// Привязка внешнего обработчика события "показать меня на карте" к обновлению положения пина
    func prepareHandlers() {
        RNSLocationManager.handlerMyLocation = { [weak self] in
            self?.updateLocation()
        }
    }
    
    /// Обновление положения пина
    func updateLocation() {
        overlayItem.geoPoint = point
        populate()
    }
}
