//
//  RNSMoveMapViewController+MapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с картой
 */
extension RNSMoveMapViewController {
    
    /// Получение карты
    var mapView: MapView {
        return RNSMapManager.mapView
    }
    
    /// Событие длительного нажатия на карту
    ///
    /// - Parameter point: географические координаты места нажатия
    func onMapLongTouchEvent(_ point: PGGeoPoint) {
        prepareStubLocation(point.location)
    }
    
    func onMapTouchEvent(_ point: PGGeoPoint) {
        print("onMapTouchEvent",point)
    }

    /// Настройка карты
    func prepareMapView() {
        RNSPageRouteManager.removeAllRoute()
        prepareItem()
    }
    
    /// Событие обновления карты
    func onMapEvent() {
        item?.prepareRoadActivateAtZoom()
    }
}
