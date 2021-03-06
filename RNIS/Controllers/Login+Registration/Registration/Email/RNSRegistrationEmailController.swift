//
//  RNSRegistrationEmailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс контроллера регистрации по почте
 */
class RNSRegistrationEmailController: RNSEmailContainerController {

    /// тип заголовка "Регистрация" "Восстановление пароля" "Сменить номер" "Сменить email"
    override var typeTitle: TypeTitle {
        return .registration
    }
    
    override func actionComplete(_ item: RNSUserPayload?) {
        item?.edit_source = "Registration_Email"
        RNSPostUpdate(item, complete: {
            STRouter.pushMain(RNSRegistrationCodeEmailController.initController($0))
            }, failure: { [weak self] error in
              self?.prepareError(error)
        })
        /*
        RNSPostRegister(item, complete: {
            STRouter.pushMain(RNSRegistrationCodeEmailController.initController($0))
        }, failure: { [weak self] error in
            self?.prepareError(error)
        })
        */
    }
}
