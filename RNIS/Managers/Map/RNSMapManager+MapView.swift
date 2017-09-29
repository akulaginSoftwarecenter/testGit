//
//  RNSMapManager+MapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapManager {
    
    static func mapCenter(_ point: PGGeoPoint?) {
        guard let point = point else {
            return
        }
        mapView.setMapCenter(point)
    }
    
    static func startLocation() {
        RNSLocationManager.startLocation {
            centerUserLocation()
            prepareRoutePoints()
        }
    }
    
    static func centerUserLocation() {
        mapCenter(RNSLocationManager.point)
    }
    
    static func testRedPlace() {
        mapCenter(redPlaceLocation.coordinate.point)
        mapView.setZoomLevel(14)
    }
}
