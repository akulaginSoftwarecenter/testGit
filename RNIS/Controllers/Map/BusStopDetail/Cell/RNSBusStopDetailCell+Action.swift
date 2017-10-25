//
//  RNSBusStopDetailCell+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение для обработки нажатия кнопок
extension RNSBusStopDetailCell {
    
    /// Событие нажатия кнопки "обновить данные"
    @IBAction func actionAlert(_ sender: Any) {
        updateNotification?()
    }
    
    /// Событие нажатия кнопки "добавить в избранное"
    @IBAction func actionFavorite(_ sender: Any) {
        updateFavorite?()
    }
}
