//
//  RNSRecoveryCodeController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRecoveryCodeController: RNSCodeContainerController {
    
    static func initController(_ phone: String?) -> UIViewController? {
        let vc = RNSRecoveryCodeController.controller as? RNSCodeContainerController
        vc?.phone = phone
        return vc
    }
    
    override var typeTitle: TypeTitle {
        return .recovery
    }
    
    override func actionNext() {
        STRouter.pushAnimatedImageBoard(RNSRecoveryParoleController.controller)
    }
    
    override func repeatCodeAction() {
        STRouter.showAlertRepeatCode()
    }
}
