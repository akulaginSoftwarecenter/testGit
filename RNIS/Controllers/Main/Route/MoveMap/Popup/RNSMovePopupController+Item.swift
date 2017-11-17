//
//  RNSMovePopupController+Item.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMovePopupController {
    /// Контроллер подписывается на получение событий
    func prepareObservers() {
        NotificationCenter.addObserverLocation(self, selector: #selector(updateItem))
    }
    
    /// Настройка представления схемы маршрута
    func prepareItem() {
        viewVariant.showMove = true
        updateItem()
    }
    
    /// Обновление представления схемы маршрута
    @objc func updateItem() {
        checkEndDoneMove()
        updateViewVariant()
    }
    
    func updateViewVariant() {
        if viewVariant == nil {
            return
        }
        viewVariant.item = item
    }
    
    func checkEndDoneMove() {
        guard item?.endDoneMove ?? false, alert == nil else {
            return
        }
        
        alert = STAlertRouter.showOk("Маршрут завершен") {
            STRouter.popToRoot()
        }
    }
}
