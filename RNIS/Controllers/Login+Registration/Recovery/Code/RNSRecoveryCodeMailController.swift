//
//  RNSRecoveryCodeMailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit
/**
 Контроллер ввода кода подтверждения для восстановления пароля
 */
class RNSRecoveryCodeMailController: RNSCodeMailContainerController {
    
    /// Создание контроллера
    ///
    /// - Parameter item: данные пользователя
    static func initController(_ item: RNSUserPayload?) -> UIViewController? {
        let vc = RNSRecoveryCodeMailController.controllerType()
        
        let container = STRouter.scrollContainer(vc)
        vc?.handlerUpdateScroll = {
            container?.prepareContentY($0)
        }
        vc?.item = item
        return STRouter.imageContainer(container)
    }
    
    /// тип заголовка "Регистрация" "Восстановление пароля" "Сменить номер" "Сменить email"
    override var typeTitle: TypeTitle {
        return .recovery
    }
    
    override func repeatCodeAction() {
        RNSEmailResetPass(item, complete: { item in
            STAlertRouter.showRepeatCode()
        }, failure: {
            STAlertRouter.showOk($0)
        })
    }
    
    override func actionComplete(_ item: RNSUserPayload?) {
        let vc = RNSRecoveryParoleController.initController(item)
        let container = STRouter.imageBoardContainer(vc)
        STRouter.pushMain(container)
    }
}
