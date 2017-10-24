//
//  RNSRegistrationParoleController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер создания пароля во время регистрации
 */
class RNSRegistrationParoleController: RNSParoleContainerController {
    
    /// Создание контроллера
    ///
    /// - Parameter item: объект с данными пользователя
    static func initController(_ item: RNSUserPayload?) -> UIViewController? {
        let vc = RNSRegistrationParoleController.controller as? RNSRegistrationParoleController
        vc?.item = item
        return vc
    }
    
    override var typeTitle: TypeTitle {
        return .registration
    }
    
    override var placeholderPassworOne: String?  {
        return "Создайте пароль"
    }
    
    override var titleBlackButton: String? {
        return "Далее"
    }
    
    override func actionComplete(_ item: RNSUserPayload?) {
        RNSRegistrationNameController.initController(item)?.pushAnimated()
    }
}
