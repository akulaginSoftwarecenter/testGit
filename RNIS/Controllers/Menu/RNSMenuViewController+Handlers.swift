//
//  RNSMenuViewController+Transform.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с клоужерами
 */
extension RNSMenuViewController {

    /// Настройка обработчиков событий меню
    func prepareHandlers()  {
        RNSMenuManager.handlerHideLeftMenu = { [weak self] animated in
            self?.hideLeftView(animated: animated)
        }

        RNSMenuManager.handlerShowLeftMenu = { [weak self] in
            self?.showLeftView(animated: true)
        }
        
        RNSMenuManager.handlerShowItem = { [weak self] item in
            self?.showItem(item)
        }
    }
}
