//
//  RNSDutyViewController+LoadData.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для загрузки данных с сервера
 */
extension RNSDutyViewController {
    
    /// Получение с сервера списка возможных маршурутов, исходя из указанных адресов "куда" и "откуда"
    func loadData() {
        prepareError(nil)
        if fromItem?.address?.isEmpty ?? true {
            prepareError("Введите адрес отправления")
            return
        }
        
        if inItem?.address?.isEmpty ?? true {
            prepareError("Введите адрес назначения")
            return
        }
        showLoader()
        RNSPostActionRouting(fromItem, to: inItem, date: currentDate, complete: { [weak self] items in
            RNSPageRouteManager.items = items
            RNSPageRouteController.controller?.pushAnimated()
            self?.removeLoader()
            self?.prepareError(nil)
            }, failure: { [weak self] text in
                self?.prepareError(text)
                self?.removeLoader()
        })
    }
    
    /// Получение адресов "куда" и "откуда" путем геокодирования известных координат. Для корректной работы функции необходимо, чтобы переданные объекты, описывающие адреса начала и конца маршрута, содержали соответствующие географические координаты.
    ///
    /// - Parameters:
    ///   - fromItem: объект, содержащий данные об адресе "откуда"
    ///   - inItem: объект, содержащий данные об адресе "куда"
    func loadStartItems(_ fromItem: RNSDutyAddressTemp?, inItem: RNSDutyAddressTemp?) {
        self.fromItem = fromItem
        self.inItem = inItem
        showLoader()
        fromItem?.loadAddress { [weak self] in
            self?.inItem?.loadAddress { [weak self] in
                self?.updateFields()
                self?.removeLoader()
            }
        }
    }
}
