//
//  RNSBlackMoveButton.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBlackMoveButton: RNSBlackButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        handlerAction = {
            RNSPageRouteManager.showMoveMapStub()
        }
        
        title = "Поехали"
    }
}
