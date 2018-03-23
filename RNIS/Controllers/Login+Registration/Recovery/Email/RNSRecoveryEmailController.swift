//
//  RNSRecoveryEmailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс контроллеера восстановления пароля по почте
 */
class RNSRecoveryEmailController: RNSEmailContainerController {

    /// тип заголовка "Регистрация" "Восстановление пароля" "Сменить номер" "Сменить email"
    override var typeTitle: TypeTitle {
        return .recovery
    }
    
    override func actionComplete(_ item: RNSUserPayload?) {
        RNSEmailResetPass(item, complete: {
            STRouter.pushMain(RNSRecoveryCodeMailController.initController($0))
        }, failure: {[weak self] item in
            self?.prepareError(item)
        })
    }
}
