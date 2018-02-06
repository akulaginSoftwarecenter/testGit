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
    
    /// Создание экземпляра местоположения маркера
    static var pinMyLocation: RNSPinMyLocation {
        return shared.pinMyLocation
    }
    
    lazy var pinMyLocation: RNSPinMyLocation = {
        return RNSPinMyLocation()
    }()
    
    /// Создание экземпляра местоположения "откуда"
    static var pointFrom: RNSDutyAddressTemp?
    /// Создание экземпляра местоположения "куда"
    static var pointHere: RNSDutyAddressTemp?
    
    /// Функция удаления маркера
    static var handlerRemovePinBuild: EmptyBlock?
    /// Функция добавления маршрута
    static var handlerAddRoute: ((PGPolyline?) -> ())?
    /// Функция показы/скрытия контроллера
    static var handlerDismissOldPresentVC: EmptyBlock?
    /// Функция показа информации
    static var handlerShowInfo: ((RNSCoordinateModel?) -> ())?
    
    static var handlerItemsUpdate: EmptyBlock?
    static var handlerStopDetailUpdate: EmptyBlock?
    static var currentItemUuid = ""
    
    /// Функция подготовки точек маршрута
    static func prepareRoutePoints() {
        let item = RNSDutyAddressTemp(RNSLocationManager.point)
        pointFrom = item
        pointHere = item
    }
    
    /// Функция удаления предыдущего маркера
    static func removeOldPinBuild() {
        handlerRemovePinBuild?()
    }
    
    static var handlerUpdateLoader: EmptyBlock?
    
    static func updateLoader() {
        handlerUpdateLoader?()
    }
    
    static func hideOldPopopovers() {
        handlerDismissOldPresentVC?()
    }
    
    static func itemsUpdate() {
        handlerItemsUpdate?()
    }
    
    static func resetMap() {
        RNSBusManager.removeAll()
        RNSDataManager.removeAllBuss()
        
        RNSStopRegionManager.reset()
        RNSBusStopManager.removeAll()
        RNSDataManager.removeAllBusStop()
        
        STRouter.mapReset()
        RNSMapManager.itemsUpdate()
    }
    
    static func stopDetailUpdate() {
        handlerStopDetailUpdate?()
    }
 }
