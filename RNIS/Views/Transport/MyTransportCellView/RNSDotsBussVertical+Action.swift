//
//  RNSDotsBussVertical+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Класс создание действия в таблице движения ТС
 */
extension RNSDotsBussVertical {
    
    /// Иницилизация уведомления при при движении по маршруту
    @IBAction func actionButton(_ sender: Any) {
        STRouter.present(RNSAlertTransportController.initController(item))
    }
}
