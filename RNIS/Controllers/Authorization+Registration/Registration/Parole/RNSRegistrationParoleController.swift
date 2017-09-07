//
//  RNSRegistrationParoleController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRegistrationParoleController: RNSParoleContainerController {
    
    var item: RNSRegisterPayload?
    
    static func initController(_ item: RNSRegisterPayload?) -> UIViewController? {
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
    
    override func actionNext() {
        item?.password = passwordOne
        
        RNSPostUpdate(item) {[weak self] error in
            self?.prepareError(error)
        }
    }
    
    func prepareError(_ error: String?) {
        containerViewController?.errorLabel.text = error
    }
}
