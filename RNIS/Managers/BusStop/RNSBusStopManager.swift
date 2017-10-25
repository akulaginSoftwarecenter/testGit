//
//  RNSBusStopManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
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
        return RNSMapManager.getZoomLevel <= 13
    }
    
    /// Переменная для хранения послдених координат
    static var lastMinCoord: PGGeoPoint {
        return mapView.lastMinCoord
    }
    
    /// Переменная для хранения последнего центра карты
    static var lastCenterCoord: PGGeoPoint {
        return mapView.lastCenterCoord
    }
    
    /// Экземпляр текущей выбранной остановки
    static func prepareCurrentStop(_ value: Bool, item: RNSBusStop?) {
        let uuid = item?.uuid ?? ""
        currentStopUuid = value ? uuid : ""
        let items = showedItems.filter{ $0.uuid == uuid }
        items.forEach{$0.handlerCurrent?()}
    }
    static var currentStopUuid = ""
}
