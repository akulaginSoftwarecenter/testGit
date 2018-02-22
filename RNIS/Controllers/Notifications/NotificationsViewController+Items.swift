//
//  NotificationsViewController+Items.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы  моделям данных
 */
extension NotificationsViewController {
    
    /// Загрузка данных
    func loadItems() {
        STRouter.showLoader()
        RNSPostNotificationList {[weak self] (reply, error, _) in
            self?.removeLoader()
            if error != nil {
                self?.parseError(error)
                return
            }
            self?.clearError()
            self?.prepareItems(reply as? [RNSNotificationModel])
        }
    }
    
    /// Метод подготовки массива данных
    func prepareItems(_ items: [RNSNotificationModel]?) {
        self.items = items
        tableView.reloadData()
    }
    
    /// Метод расчета отображения ошибки
    func parseError(_ error: NSError?) {
        if error?.isLostInet ?? false {
            prepareLostInet()
        } else {
            prepareTextTop(error?.domain)
        }
    }
    
    /// Метод подготовки заголовка
    func prepareTextTop(_ text: String?) {
        loaderWay.prepareTextTop(view,text: text, frame: rectError)
        clearItems()
    }
    
    /// Метод очистки таблицы
    func clearItems() {
        prepareItems(nil)
    }
    
    /// Убрать индикацию загрузки
    func removeLoader() {
        STRouter.removeLoader()
    }
    
    /// Переменная области ошибки
    var rectError: CGRect {
        let top = CGFloat(82)
        return CGRect(x: 0, y: top, width: UIScreen.width, height: UIScreen.height - top)
    }
    
    /// Метод появления ошибки потерянного интернета
    func prepareLostInet() {
        loaderWay.showCenterLostInet(self.view, frame: rectError)
        prepareItems(nil)
    }
    
    /// Метод очистки ошибок
    func clearError() {
        loaderWay.remove()
    }
}
