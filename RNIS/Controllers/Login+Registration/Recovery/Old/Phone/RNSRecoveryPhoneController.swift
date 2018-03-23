//
//  RNSRecoveryPhoneController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер ввода номера телефона для восстановления пароля
 */
class RNSRecoveryPhoneController: RNSPhoneContainerController {
    
    /// тип заголовка "Регистрация" "Восстановление пароля" "Сменить номер" "Сменить email"
    override var typeTitle: TypeTitle {
        return .recovery
    }

    override func actionComplete(_ item: RNSUserPayload?) {
        RNSPostConfirmSend(item, complete: {
            STRouter.pushMain(RNSRecoveryCodeController.initController($0))
        }, failure: {[weak self] item in
            self?.prepareError(item)
        })
    }
}
