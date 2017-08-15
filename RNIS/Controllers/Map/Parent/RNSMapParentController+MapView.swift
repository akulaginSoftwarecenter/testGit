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
        self.view.insertSubview(mapView, at: 0)
        mapView.autoPinEdgesToSuperviewEdges()
        mapView.clearMapCache()
        mapView.delegate = self
    }
    
    func setMapRegime(_ value: Int32) {
        mapView.setMapRegime(value)
    }
    
    func onMapEvent() {
        lightButton.updateStateLightButton()
        handlerOnMapEvent?()
    }
    
    func onMapTouchEvent(_ point: PGGeoPoint) {
        handlerOnMapTouchEvent?(point)
    }
    
    func onMapLongTouchEvent(_ point: PGGeoPoint) {
        handlerOnMapTouchEvent?(point)
    }
    
    func onOverlay(_ overlay: PGOverlay!, item: PGOverlayItem!) {
        handlerOnOverlay?(overlay, item)
    }
}
