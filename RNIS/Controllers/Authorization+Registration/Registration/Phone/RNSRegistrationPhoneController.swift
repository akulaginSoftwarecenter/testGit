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
    
    override func actionComplete(_ item: RNSRegisterPayload?) {
        RNSPostRegister(item, complete: {
            RNSRegistrationCodeController.initController($0)?.pushAnimatedImageBoard()
        }, failure: { [weak self] error in
            self?.prepareError(error)
        })
    }
}
