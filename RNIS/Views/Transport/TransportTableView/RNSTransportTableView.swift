//
//  RNSTransportTableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
Таблица для отображения транспорта
 */

class RNSTransportTableView: BaseViewWithXIBInit {

    /// Массив элементов выбора варианта маршрута
    var items: [RNSRouteVariant]?
    
    /// Создание экземпляра таблицы
    @IBOutlet var tableView: RNSRegisterTableView!
    /// Создание экземпляра вида загрузки
    lazy var loaderView = LoaderView()
    lazy var loaderWay = RNSLoaderWay()
    
    /// Инициализация таблицы
    override func awakeFromNib() {
        super.awakeFromNib()

        tableView.contentInset = UIEdgeInsetsMake(27, 0, 0, 0);
        prepareHandlers()
        prepareNotificationHandlers()
    }
    
    /// Функция подготовки блоков обновления избранного
    func prepareHandlers() {
        RNSPageRouteManager.handlerUpdateFavorite = { [weak self] in
            self?.updateUI()
        }
        
        RNSPageRouteManager.handlerShowLoaderFavoriteTransport = { [weak self] in
            self?.showLoader()
        }
    }

    /// Функция подготовки блоков уведомлений
    func prepareNotificationHandlers() {
        RNSPageRouteManager.handlerUpdateNotification = { [weak self] in
            self?.updateUI()
        }
    }
    
    func showLoader() {
        loaderView.showInView(self)
    }
    
    /// Функция обновления вида элементов экрана
    func updateUI() {
        showLoader()
        RNSPostFavoritePathList {[weak self] (reply, error, _) in
            self?.loaderView.remove()
            if error?.isLostInet ?? false {
                self?.prepareLostInet()
                return
            }
            self?.clearError()
            self?.prepareItems(reply as? [RNSRouteVariant])
        }
    }
    
    func prepareItems(_ items: [RNSRouteVariant]?) {
        self.items = items
        tableView.reloadData()
    }
    
    func prepareLostInet() {
        loaderWay.showCenterLostInet(self)
        prepareItems(nil)
    }
    
    func clearError() {
        loaderWay.remove()
    }
}
