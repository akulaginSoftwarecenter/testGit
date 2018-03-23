//
//  RNSAddressViewController+Containers.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.12.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для таблицы
 */
extension RNSAddressViewController {
    
    /// Функция подготовки таблицы
    func prepareTableView() {
        allTableHidden()
        if textIsClear {
            tableHistory.show()
            tableHistory.prepare(text)
        } else {
            tableAddress.show()
            tableAddress.prepare(text)
        }
    }
    /// Функция все таблицы скрыть
    func allTableHidden() {
        tableHistory.hidden()
        tableAddressHidden()
    }
    /// Функция скрыть таблицу с адресами
    func tableAddressHidden() {
        tableAddress.hidden()
    }
    /// Функция скрыть таблицу с адресами если нужно
    func tableAddressHiddenIfNeed(_ item: RNSAddressTemp?) {
        if item?.isHouse ?? false {
            tableAddressHidden()
        }
    }
}
