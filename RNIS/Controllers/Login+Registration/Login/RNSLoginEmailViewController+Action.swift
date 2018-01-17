//
//  RNSLoginEmailViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation
/**
 Расширение для обработки некоторых событий
 */
extension RNSLoginEmailViewController {
    
    /// Событие нажатия на кнопку "Регистрация"
    @IBAction func registrationAction(_ sender: Any) {
        push(RNSRegistrationEmailController.controller)
    }
    
    /// Событие нажатия на кнопку восстановления пароля
    @IBAction func recoveryAction(_ sender: Any) {
        push(RNSRecoveryEmailController.controller)
    }
    
    /// Событие перехода в другой контроллер
    ///
    /// - Parameter viewController: контроллер, в который будет совершен переход
    func push(_ viewController: UIViewController?) {
        let container = STRouter.imageBoardContainer(viewController)
        STRouter.pushMain(container)
    }
}
