//
//  RNSRegistrationPhoneController.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер регистрации номера телефона
 */
class RNSRegistrationPhoneController: RNSPhoneContainerController {
    
    override var typeTitle: TypeTitle {
        return .registration
    }
    
    override func actionComplete(_ item: RNSUserPayload?) {
        RNSPostRegister(item, complete: {
            STRouter.pushMain(RNSRegistrationCodeController.initController($0))
        }, failure: { [weak self] error in
            self?.prepareError(error)
        })
    }
}
