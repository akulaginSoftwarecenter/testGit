//
//  RNSMapManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
Контоллер управления картой
 */
class RNSMapManager: NSObject {
    
    static let shared = RNSMapManager()
    
    /// Создание экземпляра карты
    static var mapView: MapView {
        return shared.mapView
    }
    
    /// Создание экземпляра карты RNIS
    var mapView: MapView = RNSMapView()
    
    /// Создание экземпляра местополоежния маркера
    lazy var pinMyLocation: RNSPinMyLocation = {
        return RNSPinMyLocation()
    }()
    
    static var pointFrom: RNSDutyAddressTemp?
    static var pointHere: RNSDutyAddressTemp?
    
    static var handlerRemovePinBuild: EmptyBlock?
    static var handlerAddRoute: ((PGPolyline?) -> ())?
    static var handlerDismissOldPresentVC: EmptyBlock?
    static var handlerShowInfo: ((RNSCoordinateModel?) -> ())?
    
    static func prepareRoutePoints() {
        let item = RNSDutyAddressTemp(RNSLocationManager.point)
        pointFrom = item
        pointHere = item
    }
    
    static func removeOldPinBuild() {
        handlerRemovePinBuild?()
    }
 }
