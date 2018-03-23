//
//  RNSRegistrationCodeController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер ввода кода подтверждения во время регистрации
 */
class RNSRegistrationCodeController: RNSCodeContainerController {
    
    /// Создание контроллера
    ///
    /// - Parameter item: объект с данными пользователя
    static func initController(_ item: RNSUserPayload?) -> UIViewController? {
        let vc = RNSRegistrationCodeController.controllerType()
        
        let container = STRouter.scrollContainer(vc)
        vc?.handlerUpdateScroll = {
            container?.prepareContentY($0)
        }
        vc?.item = item
        return STRouter.imageContainer(container)
    }
    
    /// тип заголовка "Регистрация" "Восстановление пароля" "Сменить номер" "Сменить email"
    override var typeTitle: TypeTitle {
        return .registration
    }
    
    override func actionComplete(_ item: RNSUserPayload?) {
        let container = STRouter.redScrollContainer(RNSRegistrationParoleController.initController(item))
        STRouter.pushMain(container)
    }
}
