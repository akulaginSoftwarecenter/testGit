//
//  RNSBlackMoveButton.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Кнопка "поехали"
 */
class RNSBlackMoveButton: RNSBlackButton {
    
    /// метод обработки загрузки вью
    override func awakeFromNib() {
        super.awakeFromNib()
        
        handlerAction = {
           RNSPageRouteManager.showMoveMapStub()
        }
        
        title = "Поехали"
    }
}
