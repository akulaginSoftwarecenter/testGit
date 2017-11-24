//
//  RNSPageRouteManager+Route.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
/**
 Менеджер управления маршрутом
 */
extension RNSPageRouteManager {
    
    /// Фнукция обновления отображения маршрута с нужным уровнем приближения карты
    static func activeRoadReload() {
        currentItem?.prepareRoadActivateAtZoom()
    }
    
    /// Функция удаления всех маршрутов с карты
    static func removeAllRoute() {
        currentItemFavorite?.removeAllRoad()
        items?.forEach{$0.removeAllRoad()}
    }
    
    /// Функция удаления неактивных маршрутов с карты
    static func removeNonActivRoute() {
        routeNonActive?.forEach {$0.removeAllRoad() }
    }
    
    /// Функциля проверки отображения элементов контроллера карты
    static func checkContaints(_ point: PGGeoPoint?){
        for item in items ?? [] {
            if item.containts(point) {
                updateAll(item)
                break
            }
        }
    }
    
    /// Функция подготовки 
    static func prepareRoadsOff() {
        let offRoutes = self.items?.filter{ !$0.isActive }
        offRoutes?.forEach{$0.prepareRoadOff()}
    }
    
    /// Функция определение активности маршурта
    static var routeNonActive: [RNSRouteVariant]? {
        return items?.filter{ $0 !=  self.currentItem}
    }
}
