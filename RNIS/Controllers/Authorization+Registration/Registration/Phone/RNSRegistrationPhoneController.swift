//
//  RNSRegistrationPhoneController.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRegistrationPhoneController: RNSPhoneContrainerController {
    
    override var typeTitle: TypeTitle {
        return .registration
    }
    
    override func actionNext() {
        let phone = "+7" + (phoneText ?? "")
        
        RNSPostRegister(phone, complete: {
            RNSRegistrationCodeController.initController($0)?.pushAnimatedImageBoard()
        }, failure: { [weak self] error in
            self?.prepareError(error)
        })
    }
    
    func prepareError(_ error: String?) {
        containerViewController?.errorLabel.text = error
    }
}
