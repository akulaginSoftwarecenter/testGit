//
//  RNSBusStopManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import MapKit
/**
 Конроллер управления остановками ТС
 */
class RNSBusStopManager: NSObject {
    
    static let shared = RNSBusStopManager()
    
    /// Создание экземпляра отображаемой остановки ТС
    static var showedItems = [RNSBusStop]()
    /// Создание идентификатора экземпляра отображаемой остановки ТС
    static var showedUuids = [String]()
    
    /// Создание очереди для нанесения остановок ТС
    static var queue: OperationQueue {
        return shared.queue
    }
    
    /// СОздание экземпляра запроса остановок ТС
    static var request: RNSPostStopPointList?
    
    /// Создание "слабой" очереди для нанесения остановок ТС
    lazy var queue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    /// Создание экземпляра карты
    static var mapView: MapView {
        return RNSMapManager.mapView
    }
    
    /// Фукнция подготовки очереди запросов остановок ТС
    static func prepareOperation(_ complete: @escaping EmptyBlock) {
        queue.cancelAllOperations()
        queue.addOperation(complete)
    }
    
    /// Переменная необходимости прекращения загрузки
    static var isNeedStopLoad: Bool {
        return RNSMapManager.getZoomLevel < minZoomVisibleStop
    }
    
    /// Переменная для хранения послдених координат
    static var lastMinCoord: PGGeoPoint {
        return RNSMapManager.lastMinCoord
    }
    
    /// Переменная для хранения последнего центра карты
    static var lastCenterCoord: PGGeoPoint {
        return RNSMapManager.lastCenterCoord
    }
    
    /// Экземпляр текущей выбранной остановки
    static func prepareCurrentStop(_ value: Bool, item: RNSBusStop?) {
        let uuid = item?.uuid ?? ""
        currentStopUuid = value ? uuid : ""
        let items = showedItems.filter{ $0.uuid == uuid }
        items.updateIcons()
    }
    static var currentStopUuid = ""
    static var currentIsZoomSmallStop: Bool?
    
    
    static func updateZoom() {
        if let isZoom = currentIsZoomSmallStop,
            isZoomSmallStop == isZoom {
            return
        }
        currentIsZoomSmallStop = isZoomSmallStop
        showedItems.updateIcons()
    }
    
    static var getZoomLevel: Int {
        return RNSMapManager.getZoomLevel
    }
    
    static var isZoomSmallStop: Bool {
        return getZoomLevel <= minZoomVisibleStop
    }
    
    static var showLoader = false
}
