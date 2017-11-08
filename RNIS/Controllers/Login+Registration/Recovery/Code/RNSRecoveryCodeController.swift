//
//  RNSRecoveryCodeController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер ввода кода подтверждения для восстановления пароля
 */
class RNSRecoveryCodeController: RNSCodeContainerController {
    
    /// Создание контроллера
    ///
    /// - Parameter item: данные пользователя
    static func initController(_ item: RNSUserPayload?) -> UIViewController? {
        let vc = RNSRecoveryCodeController.controller as? RNSRecoveryCodeController
        
        let container = STRouter.scrollContainer(vc)
        vc?.handlerUpdateScroll = {
            container?.prepareContentY($0)
        }
        vc?.item = item
        return STRouter.imageContainer(container)
    }
  
    override var typeTitle: TypeTitle {
        return .recovery
    }
    
    override func actionComplete(_ item: RNSUserPayload?) {
        RNSRecoveryParoleController.initController(item)?.pushAnimatedImageBoard()
    }
}
