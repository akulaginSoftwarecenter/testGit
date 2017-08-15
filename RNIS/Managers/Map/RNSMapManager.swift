//
//  RNSMapManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMapManager: NSObject {
    
    static let shared = RNSMapManager()
    
    static var mapView: MapView {
        return shared.mapView
    }
    
    /**
     base mapview PGView
     */
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
        mapView.enableCompass()
        return mapView
    }()
    
    
    static var pointFrom: PGGeoPoint?
    static var pointHere: PGGeoPoint?
    
    static var handlerRemovePinBuild: EmptyBlock?
    static var handlerAddRoute: ((PGPolyline?) -> ())?
    static var handlerDismissOldPresentVC: EmptyBlock?
    static var handlerShowInfo: ((RNSCoordinateModel?) -> ())?
    
    static func prepareRoutePoints() {
        let point = RNSLocationManager.point
        pointFrom = point
        pointHere = point
    }
    
    static func removeOldPinBuild() {
        handlerRemovePinBuild?()
    }
}
