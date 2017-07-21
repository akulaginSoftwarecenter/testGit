//
//  RNSMapManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMapManager {
    static let shared = RNSMapManager()
    
    static var mapView: MapView {
        return shared.mapView
    }
    
    lazy var mapView: MapView = {
        let mapView = MapView()
        mapView.startApplication()
        mapView.clearMapCache()
        mapView.setMapHost(mapHost)
        mapView.setTrafficMarksHost(mapHost)
        mapView.enterForeground()
        mapView.enableMyLocation()
        mapView.setMapRegime(1)
        let overlay = mapView.myLocationOverlay()
        overlay?.setBitmap(#imageLiteral(resourceName: "ic_userLocation"), xOffset: 0, yOffset: 0)
        overlay?.setRotationEnabled(false)
        return mapView
    }()
    
    static func removeOldPinBuild() {
        handlerRemovePinBuild?()
    }
    
    static var handlerRemovePinBuild: EmptyBlock?
}
