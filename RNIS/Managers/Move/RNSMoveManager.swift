//
//  RNSMoveManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMoveManager: NSObject {
    
    static var isShowMoveMap = false
    
    static func showAlertExit(_ handler: EmptyBlock?) {
        STAlertRouter.showBtns("Отменить ведение по маршруту?", handlerOk: handler)
    }
    
    static func checkExitMapToRoot(_ handler: EmptyBlock?) {
        guard isShowMoveMap else {
            handler?()
            return
        }
        showAlertExit {
            RNSMenuManager.showMapToRoot()
            handler?()
        }
    }
}
