//
//  RNSRecoveryParoleController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер восстановления пароля
 */
class RNSRecoveryParoleController: RNSParoleContainerController {
    
    /// Создание контроллера
    ///
    /// - Parameter item: данные пользователя
    static func initController(_ item: RNSUserPayload?) -> RNSRecoveryParoleController? {
        let vc = RNSRecoveryParoleController.controllerType()
        vc?.item = item
        return vc
    }
 
    override var typeTitle: TypeTitle {
        return .recovery
    }
    
    override var placeholderPassworOne: String?  {
        return "Введите новый пароль"
    }
    
    override var titleBlackButton: String? {
        return "Сохранить"
    }
    
    override func actionComplete(_ item: RNSUserPayload?) {
        item?.new_phone = nil
        RNSPostUpdate(item, complete: { [weak self] _ in
            self?.login()
        }, failure: { [weak self] error in
            self?.prepareError(error)
        })
    }
    
    /// Авторизация пользователя
    func login() {
        RNISAuthManager.loginEmail(item?.email, password: item?.password, success: {
            STRouter.showMapReset()
            STAlertRouter.showOk("Пароль успешно изменён")
            }, failure: {[weak self] (errorText) in
            self?.prepareError(errorText)
        })
    }
    
    /// Заполнение надписи для демонстрации ошибок во внутреннем контроллере
    ///
    /// - Parameter error: текст ошибки
    func prepareError(_ error: String?) {
        containerViewController?.prepareError(error)
    }
}
