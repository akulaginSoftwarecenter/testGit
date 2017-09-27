//
//  RNSRecoveryParoleController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRecoveryParoleController: RNSParoleContainerController {
    
    static func initController(_ item: RNSUserPayload?) -> UIViewController? {
        let vc = RNSRecoveryParoleController.controller as? RNSRecoveryParoleController
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
        RNSPostUpdate(item, complete: { [weak self] _ in
            self?.login()
        }, failure: { [weak self] error in
            self?.prepareError(error)
        })
    }
    
    func login() {
        RNISAuthManager.login(item?.phone, password: item?.password) {[weak self] (errorText) in
            self?.prepareError(errorText)
        }
    }
    
    func prepareError(_ error: String?) {
        containerViewController?.errorLabel.text = error
    }
}
