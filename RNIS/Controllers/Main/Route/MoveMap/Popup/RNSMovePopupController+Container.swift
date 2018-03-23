//
//  RNSMovePopupController+Container.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для настройки внутреннего контроллера
 */
extension RNSMovePopupController {
    /// Функция подготовки контейнера
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        containerController = segue.destination as? RNSMoveDetailController
        prepareEnterViewController()
    }
    
    /// Настройка внутреннего контроллера
    func prepareEnterViewController() {
        containerController?.item = item
        containerController?.handlerBack = { [weak self] in
            self?.handlerDetailBack?()
        }
    }
}
