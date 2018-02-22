//
//  MenuItemFavorite.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс ячейка меню пункта "Избранное"
 */
class MenuItemFavorite: MenuItem {
    
    /// Метод инициализации 
    convenience init() {
        self.init(favoriteTitle, TransportViewController.initialRed, #imageLiteral(resourceName: "menuStarIcon"))
    }
    
    /// Метод появления
    override func show() {
        RNSMoveManager.checkExitMapToRoot {
            super.show()
        }
    }
    
    /// Метод обновления
    override func updateIfNeed() {
        RNSPageRouteManager.handlerUpdateFavorite?()
        RNSMenuManager.handlerUpdateFavoriteBuss?()
    }
}

