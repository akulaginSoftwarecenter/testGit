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
    
    static func bussStopsUpdate() {
        
        let operation = BlockOperation(block:{
            bussStopsUpdateOperation()
        })
   
        queue.cancelAllOperations()
        queue.addOperation(operation)
    }

    static func bussStopsUpdateOperation() {
        guard getZoomLevel > 14 else {
            Utils.mainQueue {
                removeOLdBusStops()
            }
            return
        }
        
        let uuids = RNSDataManager.bussStopsUuids(mapView.lastMinCoord, center: mapView.lastCenterCoord)
        Utils.mainQueue {
            CounterTime.startTimer()
            removeOLdBusStops()
            showPinBusStopUuids(uuids)
            CounterTime.endTimer()
        }
    }
    
    static func showPinBusStopUuids(_ uuids: [String]?) {
        guard let items = uuids?.flatMap({ (uuid) -> RNSBusStop? in
            return RNSDataManager.realm?.object(ofType: RNSBusStop.self, forPrimaryKey: uuid)
        }) else {
            return
        }
        showPinBusStop(items)
    }
    
    static func removeOLdBusStops() {
        guard let items = showedStops else {
            return
        }
        for item in items {
            item.handlerRemove?()
        }
        showedStops = nil
    }
}
