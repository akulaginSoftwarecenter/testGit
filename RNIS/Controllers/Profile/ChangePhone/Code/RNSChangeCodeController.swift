//
//  RNSChangeCodeController.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSChangeCodeController: RNSCodeContainerController {
    
    static func initController(_ phone: String?) -> UIViewController? {
        let vc = RNSChangeCodeController.controller as? RNSCodeContainerController
        //vc?.phone = phone
        return vc
    }
    
    override var typeTitle: TypeTitle {
        return .change
    }
    
    override func actionNext() {
        STRouter.pop(animated: false) {
            STRouter.pop(animated: false) {
                STRouter.showAlertOk("Номер телефона успешно изменён")
            }
        }
    }
    
    override func repeatCodeAction() {
        STRouter.showAlertRepeatCode()
    }
}
