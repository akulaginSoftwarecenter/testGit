//
//  RNSRegistrationCodeController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRegistrationCodeController: RNSCodeContainerController {
    
    static func initController(_ phone: String?) -> UIViewController? {
        let vc = RNSRegistrationCodeController.controller as? RNSCodeContainerController
        vc?.phone = phone
        return vc
    }
    
    override var typeTitle: TypeTitle {
        return .registration
    }
    
    override func actionNext() {
        STRouter.pushAnimatedImageBoard(RNSRegistrationParoleController.controller)
    }
    
    override func repeatCodeAction() {
        STRouter.showAlertRepeatCode()
    }
}
