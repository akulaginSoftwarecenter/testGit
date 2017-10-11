//
//  RNSRouteVariant+Map.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteVariant {
    func zoomToRoute() {
        let mapView = RNSMapManager.mapView
        if let point = points?.first?.point {
            mapView.setMapCenter(point)
        }
        mapView.setZoomLevel(17)
    }
}
