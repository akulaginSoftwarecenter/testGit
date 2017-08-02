//
//  RNSRegistrationParoleController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRegistrationParoleController: RNSParoleContainerController {
    
    override var typeTitle: TypeTitle {
        return .registration
    }
    
    override var placeholderPassworOne: String?  {
        return "Создайте пароль"
    }
    
    override var titleBlackButton: String? {
        return "Далее"
    }
    
    override func actionNext() {
        /*
        let vc = RNSRegistrationNameController.initialController
        STRouter.pushAnimatedImageBoard(vc)
        */
    }
}
