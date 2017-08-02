//
//  RNSRecoveryParoleController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRecoveryParoleController: RNSParoleContainerController {

    override var titleTextTop: String {
        return kForgotPassword
    }
    
    override var placeholderPassworOne: String?  {
        return "Введите новый пароль"
    }
    
    override var titleBlackButton: String? {
        return "Сохранить"
    }
    
    override func actionNext() {
        STRouter.showLogin()
    }
}
