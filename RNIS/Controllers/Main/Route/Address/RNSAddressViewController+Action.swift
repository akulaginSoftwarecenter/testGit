//
//  RNSAddressViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для обработки нажатий на некоторые кнопки
 */
extension RNSAddressViewController {
    
     /// Событие нажатия на кнопку возврата на предыдущий контроллер
    @IBAction func backButton(_ sender: Any) {
        backAction(sender)
        STRouter.pop()
    }
    
    /// Событие нажатия на кнопку "показать меня на карте"
    @IBAction func actionMyLocation(_ sender: Any) {
        geoCodeMylocation()
    }
    
    /// Событие нажатия на кнопку возврата на преддущий контроллер
    @IBAction func backAction(_ sender: Any) {
        updateItem()
        complete?(item)
        if let text = text, !text.isEmpty  {
            RNSDataManager.createSearchItem(text, point: point)
        }
    }
    /// Событие нажатия на кнопку конца редактирования
    @IBAction func actionTop(_ sender: Any) {
        endEdit()
    }
}
