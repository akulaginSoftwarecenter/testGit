//
//  RNSLoginViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import Alamofire

/**
 Расширение для обработки некоторых событий
 */
extension RNSLoginViewController {
    
    /// Событие нажатия на кнопку "Регистрация"
    @IBAction func registrationAction(_ sender: Any) {
        push(RNSRegistrationPhoneController.controller)
    }
    
    /// Событие нажатия на кнопку восстановления пароля
    @IBAction func recoveryAction(_ sender: Any) {
        push(RNSRecoveryPhoneController.controller)
    }
    
    /// Событие перехода в другой контроллер
    ///
    /// - Parameter viewController: контроллер, в который будет совершен переход
    func push(_ viewController: UIViewController?) {
        STRouter.pushAnimatedImageBoard(viewController)
    }
}
