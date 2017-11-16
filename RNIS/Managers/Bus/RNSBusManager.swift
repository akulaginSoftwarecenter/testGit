//
//  RNSBusManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Конроллер управления ТС
 */
class RNSBusManager: NSObject {
    static let shared = RNSBusManager()
    
    /// Переменная хранения ТС
    static var showedItems = [RNSBus]()
    /// Переменная хранения идентификаторов ТС
    static var showedUuids = [String]()
    
    /// Создание статической очереди для нанесения ТС на карту
    static var queue: OperationQueue {
        return shared.queue
    }
    
    /// Создание "слабой" очереди для нанесения ТС на карту
    lazy var queue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    /// Создание экземпляра карты
    static var mapView: MapView {
        return RNSMapManager.mapView
    }
    
    /// Создание переменной запроса
    static var request: RNSPostBusList?
    
    /// Функция подготовки запросов ТС
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
        return mapView.lastMinCoord
    }
    
    /// Переменная для хранения последнего центра карты
    static var lastCenterCoord: PGGeoPoint {
        return mapView.lastCenterCoord
    }
    
    static var showLoader = false
}
