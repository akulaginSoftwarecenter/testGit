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
 RNSLoginViewController Action extention
 */

extension RNSLoginViewController {
    
    @IBAction func registrationAction(_ sender: Any) {
        push(RNSRegistrationPhoneController.controller)
    }
    
    @IBAction func recoveryAction(_ sender: Any) {
        push(RNSRecoveryPhoneController.controller)
    }
    
    func push(_ viewController: UIViewController) {
        STRouter.pushAnimatedImageBoard(viewController)
    }
}
