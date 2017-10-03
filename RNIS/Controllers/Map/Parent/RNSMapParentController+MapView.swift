//
//  RNSMapParentController+MapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapParentController: PGMapViewDelegate {
    
    func prepareMapView() {
        view.insertSubview(mapView, at: 0)
        mapView.frame = CGRect(x: 0, y: 0, width: UIScreen.width, height: UIScreen.height)
        mapView.clearMapCache()
        mapView.delegate = self
    }
    
    func setMapRegime(_ value: Int32) {
        mapView.setMapRegime(value)
    }
    
    func onMapEvent() {
        lightButton.updateStateLightButton()
        updateZoom()
        handlerOnMapEvent?()
        busUpdate()
        busStopUpdate()
    }
    
    func onMapTouchEvent(_ point: PGGeoPoint) {
        handlerOnMapTouchEvent?(point)
    }
    
    func onMapLongTouchEvent(_ point: PGGeoPoint) {
        handlerOnMapLongTouchEvent?(point)
    }
    
    func onOverlay(_ overlay: PGOverlay!, item: PGOverlayItem!) {
        handlerOnOverlay?(overlay, item)
    }
    
    func onPoiMarker(_ info: String!) {
        print("onPoiMarker",info)
    }
    
    func onGeoblogMarker(_ eventid: Int32) {
        print("onGeoblogMarker")
    }
}
