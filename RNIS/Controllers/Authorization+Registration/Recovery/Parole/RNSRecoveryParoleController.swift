//
//  RNSRecoveryParoleController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRecoveryParoleController: RNSParoleContainerController {
    
    static func initController(_ item: RNSRegisterPayload?) -> UIViewController? {
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
    
    override func actionComplete(_ item: RNSRegisterPayload?) {
        RNSPostUpdate(item, complete: {
            STRouter.showLogin($0)
        }, failure: { [weak self] error in
            self?.prepareError(error)
        })
    }
    
    func prepareError(_ error: String?) {
        containerViewController?.errorLabel.text = error
    }
}
