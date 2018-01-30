//
//  RNISAuthManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер авторизации
 */
class RNISAuthManager {
    
    /// Функция выхода из приложения
    static func logout() {
        STRouter.showLoader()
        RNSPostLogout { _, _, _ in
            STRouter.removeLoader()
            clearUserDefaults()
            STRouter.showMapReset()
            RNSMenuManager.leftMenuUpdate()
            RNSMenuManager.handlerClearProfile?()
        }
    }
    
    /// Функция очистки истории пользователя
    static func clearUserDefaults() {
        UserDefaults.removeUserData()
        UserDefaults.removeLogin()
        UserDefaults.removePassword()
    }

    /// Функция авторизации в приложении
    static func login(_ login: String?, password: String?, success: EmptyBlock?, failure: AliasStringBlock?) {
        STRouter.showLoader()
        RNSPostLogin(login, password: password, complete: {
            STRouter.removeLoader()
            success?()
            RNSMenuManager.leftMenuUpdate()
            }, failure: { (errorText) in
                STRouter.removeLoader()
                failure?(errorText)
        })
    }
    
    /// Функция авторизации в приложении
    static func loginEmail(_ email: String?, password: String?, success: EmptyBlock?, failure: AliasStringBlock?) {
        STRouter.showLoader()
        RNSPostLoginEmail(email, password: password, complete: {
            
            STRouter.removeLoader()
            success?()
            RNSMenuManager.leftMenuUpdate()
        }, failure: { (errorText) in
            STRouter.removeLoader()
            failure?(errorText)
        })
    }
}
