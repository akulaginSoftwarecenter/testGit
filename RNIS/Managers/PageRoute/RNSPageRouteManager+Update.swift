//
//  RNSPageRouteManager+Update.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
/**
 Менеджер управления обновления маршрутов
 */
extension RNSPageRouteManager {
    
    /// Функция обновления маршрута
    static func updateAll(_ currentItem: RNSRouteVariant?) {
        if self.currentItem == currentItem {
            return
        }
        updateMap(currentItem)
        handlerUpdateCurrent?()
    }
    
    /// Функция обновления карты
    static func updateMap(_ currentItem: RNSRouteVariant?) {
        if self.currentItem == currentItem {
            return
        }
        self.currentItem = currentItem
        
        updateRoads()
        handlerUpdateCurrentTwo?()
    }
    
    /// Функция обновления маршрутов
    static func updateRoads() {
        prepareRoadsOff()
        currentItem?.prepareRoadActivate()
    }
}
