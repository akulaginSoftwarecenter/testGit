//
//  RNSMenuBarItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Кнопка меню
 */
class RNSMenuBarItem: UIBarButtonItem {
    
    /// метод обработки загрузки вью
    override func awakeFromNib() {
        super.awakeFromNib()
        target = self
        action = #selector(actionTap)
    }
    
    /// Событие нажатия
    @objc func actionTap() {
        RNSMenuManager.showLeftMenu()
    }
}
