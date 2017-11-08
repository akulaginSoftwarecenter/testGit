//
//  RNSPinParent.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Базовое представление пина на карте
 */
class RNSPinParent: PGOverlay {
    
    /// Модель, которая конфигурирует оверлей (по сути содержит только географические координаты)
    lazy var overlayItem = PGOverlayItem()

    /// Создание и добавление модели в оверлей
    ///
    /// - Parameter point: географические координаты положения оверлея на карте
    func preparePoint(_ point: PGGeoPoint) {
        items().add(overlayItem)
        addOnMap()
        overlayItem.geoPoint = point
        populate()
    }
    
    /// Добавить оверлей на карту
    func addOnMap() {
        RNSMapManager.addOverlay(self)
    }
    
    /// Убрать оверлей с карты
    func remove() {
        RNSMapManager.removeOverlay(self)
    }
}
