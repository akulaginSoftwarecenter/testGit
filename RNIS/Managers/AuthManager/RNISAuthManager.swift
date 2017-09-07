//
//  RNISAuthManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNISAuthManager {
    /**
     *  get токен at com.rnis.auth.action.login, after show map
     */
    static func checkToken() {
        if UserDefaults.token != nil {
            STRouter.showMenu()
        } else {
            STRouter.showLogin()
        }
    }
    
    static func logout() {
        STRouter.showLoader()
        RNSPostLogout { _, _, _ in
            STRouter.removeLoader()
            UserDefaults.removeToken()
            STRouter.showLogin()
        }
    }
}
