//
//  RNSMapParentController+MapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение для работы с картой
extension RNSMapParentController: PGMapViewDelegate {
    
    /// Настройка карты
    func prepareMapView() {
        view.insertSubview(mapView, at: 0)
        mapView.frame = CGRect(x: 0, y: 0, width: UIScreen.width, height: UIScreen.height)
        mapView.clearMapCache()
        mapView.delegate = self
    }
    
    /// Настройка режима карты
    ///
    /// - Parameter value: значение режима карты
    func setMapRegime(_ value: Int32) {
        mapView.setMapRegime(value)
    }
    
    /// Событие обновления карты
    func onMapEvent() {
        lightButton.updateStateLightButton()
        updateZoom()
        handlerOnMapEvent?()
        itemsUpdate()
    }
    
    /// Событие нажатия на карту
    ///
    /// - Parameter point: географические координаты места нажатия
    func onMapTouchEvent(_ point: PGGeoPoint) {
        print("onMapTouchEvent",point)
        handlerOnMapTouchEvent?(point)
    }
    
    /// Событие длительного нажатия на карту
    ///
    /// - Parameter point: географические координаты места нажатия
    func onMapLongTouchEvent(_ point: PGGeoPoint) {
        handlerOnMapLongTouchEvent?(point)
    }
    
    /// Событие добавления оверлея на карту
    ///
    /// - Parameters:
    ///   - overlay: оверлей
    ///   - item: объект, содержащий информацию о географическом положении оверлея
    func onOverlay(_ overlay: PGOverlay!, item: PGOverlayItem!) {
        handlerOnOverlay?(overlay, item)
    }
    
    func onPoiMarker(_ info: String!) {
        
    }
    
    func onLocationChanged(_ newLocationData: [AnyHashable : Any]!) {
        guard let lat = (newLocationData["lat"] as AnyObject).doubleValue ,
            let lon = (newLocationData["lon"] as AnyObject).doubleValue   else {
            return
        }
        var point = PGGeoPoint()
        point.latitude = lat/100000
        point.longitude = lon/100000
        RNSMapManager.pinMyLocation.updateLocation(point)
    }
    
    func onGeoblogMarker(_ eventid: Int32) {
        print("onGeoblogMarker")
    }
}
