//
//  RNSMoveDetailController+Flag.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с кнопкой "добавить в избранное"
 */
extension RNSMoveDetailController {
    
    /// Настройка кнопки
    func prepareHandlers() {
        flagView.handlerUpdate = { [weak self] in
            self?.updateFlag()
        }
        NotificationCenter.addObserverUpdateFavorite(self, selector: #selector(updateFlagImage))
    }
    
    /// Обновление кнопки
    func updateFlag() {
        item?.changeFavorite()
    }
    
    /// Обновление рисунка кнопки
    @objc func updateFlagImage() {
        flagView.isFavorite = item?.isFavorite ?? false
    }
}
