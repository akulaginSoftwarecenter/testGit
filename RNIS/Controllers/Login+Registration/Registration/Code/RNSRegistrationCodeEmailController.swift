//
//  RNSRegistrationCodeEmailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер ввода кода подтверждения во время регистрации
 */
class RNSRegistrationCodeEmailController: RNSCodeMailContainerController {
    
    /// Создание контроллера
    ///
    /// - Parameter item: объект с данными пользователя
    static func initController(_ item: RNSUserPayload?) -> UIViewController? {
        let vc = RNSRegistrationCodeEmailController.controllerType()
        
        let container = STRouter.scrollContainer(vc)
        vc?.handlerUpdateScroll = {
            container?.prepareContentY($0)
        }
        vc?.item = item
        return STRouter.imageContainer(container)
    }
    
    override var typeTitle: TypeTitle {
        return .registration
    }
    
    override func actionComplete(_ item: RNSUserPayload?) {
        let container = STRouter.redScrollContainer(RNSRegistrationParoleController.initController(item))
        STRouter.pushMain(container)
    }
}
