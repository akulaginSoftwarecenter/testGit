//
//  RNSAddressViewController+Item.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.12.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для данных
 */
extension RNSAddressViewController {
    
    /// Функция подготовки вью для главной переменной инициализации
    func prepareItem() {
        addPinMapCenter(item?.point)
    }
    
    /// Настройка переменной, содержащей данные о расположении
    func updateItem() {
        if item == nil {
            item = RNSDutyAddressTemp()
        }
        item?.address = text
        let point = pin?.overlayItem.geoPoint
        item?.latitude = point?.latitude
        item?.longitude = point?.longitude
    }
    /// Функция подготовки контейнера переменной инициализации
    func prepareItemContainers(_ item: RNSAddressTemp?) {
        prepareAddressContainers(item?.name)
        addPinMapCenter(item?.point)
        tableAddressHiddenIfNeed(item)
    }
    /// Функция очистки ячейки
    func clearPoint() {
        point = nil
    }
}
