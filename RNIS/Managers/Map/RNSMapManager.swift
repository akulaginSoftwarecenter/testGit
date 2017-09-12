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
    var mapView: MapView = RNSMapView()
    
    lazy var pinMyLocation: RNSPinMyLocation = {
        return RNSPinMyLocation()
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
    
    static var getZoomLevel: Int {
        return Int(mapView.getZoomLevel())
    }
    
    static var showedStops: [RNSBusStop]?
    
    static func showMoveMap() {
        RNSPageRouteManager.removeNonActivRoute()
        RNSMoveMapViewController.controller.pushAnimated()
    }
}
