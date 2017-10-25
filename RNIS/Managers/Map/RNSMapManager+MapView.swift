//
//  RNSMapManager+MapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
/**
 Контоллер управления картой
 */
extension RNSMapManager {
    
    
    /// Функция установки центра карты
    static func mapCenter(_ point: PGGeoPoint?) {
        guard let point = point else {
            return
        }
        mapView.setMapCenter(point)
    }
    
    /// Функция старта определения местоположения
    static func startLocation() {
        RNSLocationManager.startLocation {
            centerUserLocation()
            prepareRoutePoints()
        }
    }
    
    /// Функция центрирования карты по местоположению пользователя
    static func centerUserLocation() {
        mapCenter(RNSLocationManager.point)
    }
    
    /// Функция установки выбранного местоположения
    static func testRedPlace() {
        mapCenter(redPlaceLocation.coordinate.point)
        setZoomLevel(14)
    }
    
    /// Функция установки уровня приближения карты
    static func setZoomLevel(_ zoom: Int32) {
        mapView.setZoomLevel(zoom)
    }
    
    /// Фнукция установки начального зума на карте
    static func firstZoomIfNeed() {
        if !UserDefaults.isDidFirstZoom {
            UserDefaults.firstZoomComplete()
            setZoomLevel(14)
        }
   }
}
