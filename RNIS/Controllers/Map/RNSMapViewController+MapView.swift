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
        }
    }
    
    func centerUserLocation() {
        mapView.setMapCenter(RNSLocationManager.point)
        mapView.setZoomLevel(13)
    }
    
    func onMapEvent() {
        updateStateLightButton()
    }
}
