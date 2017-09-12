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
        mapView.setZoomLevel(13)
    }
    
    static func bussStopsUpdateShow() {
        removeOLdBusStops()
        print("bussStopsUpdateShow",getZoomLevel)
        if getZoomLevel < 15 {
            return
        }
        CounterTime.startTimer()
        RNSDataManager.bussStopsAsync(mapView.lastMinCoord, center: mapView.lastCenterCoord) { items in
            CounterTime.endTimer()
            guard let items = items else {
                return
            }
            print("items",items.count)
            showPinBusStop(items)
            CounterTime.endTimer()
        }
    }
}
