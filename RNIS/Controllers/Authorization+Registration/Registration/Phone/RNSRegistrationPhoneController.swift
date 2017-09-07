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
        RNSRegistrationCodeController.initController(item)?.pushAnimatedImageBoard()
    }
}
