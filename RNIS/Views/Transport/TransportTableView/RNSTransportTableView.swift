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
        
        loaderWay.backgroundColor = .blue
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
            
            let items = reply as? [RNSRouteVariant]
            if items?.count == 0 {
                self?.prepareNoItems()
                return
            }
            
            self?.clearError()
            self?.prepareItems(items)
        }
    }
    
    func prepareItems(_ items: [RNSRouteVariant]?) {
        self.items = items
        tableView.reloadData()
       // prepareNoItemsIfNeed()
    }
    
    func prepareLostInet() {
        loaderWay.showCenterLostInet(self)
        clearItems()
    }
    
    func prepareNoItems() {
        loaderWay.prepareTextTop(self,text:"Вы еще не добавляли свои маршруты")
        clearItems()
    }

    func clearItems() {
        prepareItems(nil)
    }
    
    func clearError() {
        loaderWay.remove()
    }
}
