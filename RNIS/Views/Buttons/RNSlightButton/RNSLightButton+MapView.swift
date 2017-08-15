//
//  RNSLightButton+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSLightButton {
    
    var mapView: MapView {
        return RNSMapManager.mapView
    }
    
    var getTraffic: Bool {
        return mapView.getTraffic()
    }
    
    func changeTraffic() {
        mapView.setTraffic(!getTraffic)
        updateStateLightButton()
    }
    
    func updateStateLightButton() {
        if getTraffic {
            loadTraffic(minCoord: mapView.lastMinCoord, maxCoord: mapView.lastMaxCoord, zoom: mapView.getZoomLevel())
        } else {
            hiddenTraffic()
        }
    }
}
