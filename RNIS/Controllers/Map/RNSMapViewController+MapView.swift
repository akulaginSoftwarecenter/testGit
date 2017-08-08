//
//  RNSMapViewController+MapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapViewController: PGMapViewDelegate {
    
    func prepareMapView() {
        mapView.enableCompass()
    }
    
    func startLocation() {
        RNSLocationManager.startLocation { [weak self] in
            self?.centerUserLocation()
            RNSMapManager.prepareRoutePoints()
        }
    }
    
    func centerUserLocation() {
        mapCenter(RNSLocationManager.point)
        mapView.setZoomLevel(13)
    }
    
    func onMapEvent() {
        updateStateLightButton()
    }
    
    func onMapTouchEvent(_ point: PGGeoPoint) {
        dismissOldPresentVC()
    }
    
    func onMapLongTouchEvent(_ point: PGGeoPoint) {
        RNSBuildRouteView(point)
        mapCenter(point)
        RNSPinBuild(point)
    }
    
    func onOverlay(_ overlay: PGOverlay!, item: PGOverlayItem!) {
        mapCenter(item.geoPoint)
        showBusStopIfNeed(overlay)
    }
    
    func mapCenter(_ point: PGGeoPoint) {
        mapView.setMapCenter(point)
    }
 }
