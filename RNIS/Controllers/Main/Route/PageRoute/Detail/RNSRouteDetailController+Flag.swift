//
//  RNSRouteDetailController+Flag.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с кнопкой добавления в избранное
 */

extension RNSRouteDetailController {
    
    /// Настройка кнопки
    func prepareFlagView() {
        flagView.handlerUpdate = { [weak self] in
            self?.updateFlag()
        }
        updateFlagImage()
    }
    
    /// Обновление кнопки
    func updateFlag() {
        item?.changeFavorite { [weak self] in
            self?.updateFlagImage()
        }
    }
    
    /// Обновление рисунка кнопки
    func updateFlagImage() {
        flagView.isFavorite = item?.isFavorite ?? false
    }
}
