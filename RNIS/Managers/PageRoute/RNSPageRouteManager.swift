//
//  RNSPageRoute.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
/**
 Менеджер управления вариантами маршрутов
 */
class RNSPageRouteManager: NSObject {
    
    /// Блок обновления певрой точки маршурта
    static var handlerUpdateCurrent: EmptyBlock?
    /// Блок обновления второй точки маршурта
    static var handlerUpdateCurrentTwo: EmptyBlock?
    /// Блок обновления избранной точки
    static var handlerUpdateFavorite: EmptyBlock?
    
    static var handlerShowLoaderFavoriteTransport: EmptyBlock?
    /// Блок обновления уведомлений
    static var handlerUpdateNotification: EmptyBlock?
    
    /// Создание массива элементов маршрута
    static var items: [RNSRouteVariant]? {
        didSet {
            updateAll(items?.first)
        }
    }
    
    static var currentItemFavorite: RNSRouteVariant?
    /// Создание экземпляра текущей точки маршрута
    static var currentItem: RNSRouteVariant?
    
    /// Создание экземпляра текущего индекса точки маршрута
    static var currentIndex: Int? {
        guard let currentItem = currentItem else {
            return nil
        }
        return items?.index(of: currentItem)
    }
    
    /// Определение расстояния
    static func prepareFirstNavel(_ distance: CLLocationDistance?) {
        currentItem?.navels?.first?.distance = distance
        currentItem?.updateNodes()
    }
    
    /// Удаление маршрута
    static func removeItem(_ item: RNSRouteVariant?) {
        showLoaderFavoriteTransport()
        item?.removeItem {
            updateFavorite()
        }
    }
    
    /// Обновление имени маршрута
    static func updateName(_ item: RNSRouteVariant?) {
        showLoaderFavoriteTransport()
        item?.updateName {
            updateFavorite()
        }
    }
   
    /// Отображение тени перемещения
    static func showMoveMapStub() {
        //RNSPageRouteManager.prepareFirstNavel(523)
        let vc = RNSMoveMapViewController.initController(RNSPageRouteManager.currentItem)
        vc?.handlerDidDisappear = {
             updateRoads()
        }
        vc?.pushAnimated()
    }

    /// Обновление оповещений
    static func updateNotification() {
        handlerUpdateNotification?()
    }
    
    /// Обновление избранного
    static func updateFavorite() {
        handlerUpdateFavorite?()
    }
    
    /// Отображение текущего элемента на карте
    static func currentPrepareDisplay() {
        currentItem?.prepareDisplayMap()
    }
    
    static func showLoaderFavoriteTransport() {
        handlerShowLoaderFavoriteTransport?()
    }
}
