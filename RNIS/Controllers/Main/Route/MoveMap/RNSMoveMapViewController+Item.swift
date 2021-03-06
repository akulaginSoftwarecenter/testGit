//
//  RNSMoveMapViewController+Item.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
Расширение для работы с объектом, содержащим информацию о маршруте
 */
extension RNSMoveMapViewController {
    /// Функция подготовки вью для главной переменной инициализации
    func prepareItem() {
        item?.prepareRoadActivate()
        item?.prepareDisplayMapFirst()
        item?.showDistanceNavels = true
    }
    
    func closeItem() {
        item?.removeAllRoad()
        item?.showDistanceNavels = false
    }
}
