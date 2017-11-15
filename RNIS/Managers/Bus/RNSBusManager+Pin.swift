//
//  RNSBusManager+Pin.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Экземпляр конроллера управления ТС для отображения ТС на карте
 */
extension RNSBusManager {
    /// Функция отображения идентификаторов маркеров
    static func showPinsUuids(_ uuids: [String]?) {
        guard let items = buss(uuids) else {
            return
        }
        showPinsItems(items)
    }
    
    /// Функцил отображения экземпляров маркеров
    static func showPinsItems(_ items: [RNSBus]?) {
        guard let items = items else {
            return
        }
        showedItems.append(contentsOf: items)
        
        for item in items {
            item.handlerRemove?()
            _ = RNSPinBus(item)
        }
    }
    
    /// Фнукция отображения всех маркеров
    static func showPinAll() {
        guard let items = RNSDataManager.buss else {
            return
        }
        showPinsItems(Array(items))
    }
    
    /// Функция удаления всех "старых" маркеров
    static func removeOldAll() {
        for item in showedItems {
            item.handlerRemove?()
        }
        self.showedItems = [RNSBus]()
        self.showedUuids = [String]()
    }
    
    /// Функция удаления всех "старых" идентификаторов
    static func removeOld(_ uuids: [String]?) {
        guard let uuids = uuids else {
            return
        }
        let items = showedItems.filter{ uuids.contains($0.uuid) }
        for item in items {
            item.handlerRemove?()
        }
        showedItems = showedItems.filter{ !items.contains($0) }
    }

}
