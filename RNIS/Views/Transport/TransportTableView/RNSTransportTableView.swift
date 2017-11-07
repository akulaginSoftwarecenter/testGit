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
    }

    /// Функция подготовки блоков уведомлений
    func prepareNotificationHandlers() {
        RNSPageRouteManager.handlerUpdateNotification = { [weak self] in
            self?.updateUI()
        }
    }
    
    /// Функция обновления вида элементов экрана
    func updateUI() {
        loaderView.showInView(self)
        RNSPostFavoritePathList {[weak self] (reply, error, _) in
            self?.loaderView.remove()
            self?.items = reply as?[RNSRouteVariant]
            self?.tableView.reloadData()
        }
    }
}
