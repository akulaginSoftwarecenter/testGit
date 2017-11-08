//
//  RNSBusStopDetailController+UpdateData.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение обновления данных
extension RNSBusStopDetailController {
    
    /// Загрузка с сервера списка автобусных маршрутов
    func loadItems(_ loaderTwo: Bool = false) {
        showLoader(loaderTwo)
        RNSStopPointRoutes(item, complete: { [weak self] items in
            self?.prepareItems(items)
            self?.removeLoader(loaderTwo)
            }, failure: { [weak self] error in
                self?.loaderView.prepareFailure()
        })
    }
    
    /// Обновление данных в таблице
    ///
    /// - Parameter items: список автобусных маршрутов
    func prepareItems(_ items: [RNSBusRouteTemp]?) {
        self.items = items
        prepareTableView()
    }
    
    /// Показать представление индикации загрузки
    func showLoader(_ loaderTwo: Bool = false) {
        if loaderTwo {
            loaderViewTwo.showInView(self.view)
        } else {
            loaderView.showInView(self.view)
        }
    }
    
    /// Убрать представление индикации загрузки
    func removeLoader(_ loaderTwo: Bool = false) {
        if loaderTwo {
            loaderViewTwo.remove()
        } else {
            loaderView.remove()
        }
        
    }
    
    /// Обновление надписи выбранной остановки
    func prepareTitle() {
        titleLabel.text = item?.name
    }
    
    /// Добавление автобусного маршрута в избранное
    ///
    /// - Parameter item: модель автобусного маршрута
    func updateFavorite(_ item: RNSBusRouteTemp?) {
        guard let item = item else {
            return
        }
        RNSPostFavoriteRouteCreate(item) { [weak self] in
            self?.removeLoader(true)
            self?.loadItems(true)
        }
        showLoader(true)
    }

    func updateNotification(_ busRoute: RNSBusRouteTemp?) {
        guard let item = item, let busRoute = busRoute else {
            return
        }
        RNSNotificationCreate(bus: busRoute, stop: item, time: "20") { [weak self] in
            self?.removeLoader(true)
            self?.loadItems(true)
        }
        showLoader(true)
    }
}