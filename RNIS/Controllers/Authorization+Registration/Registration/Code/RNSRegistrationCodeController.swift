//
//  RNSRegistrationCodeController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRegistrationCodeController: RNSCodeContainerController {
    
    static func initController(_ item: RNSRegisterPayload?) -> UIViewController? {
        let vc = RNSRegistrationCodeController.controller as? RNSRegistrationCodeController
        vc?.item = item
        return vc
    }
    
    override var typeTitle: TypeTitle {
        return .registration
    }
    
    override func actionComplete(_ item: RNSRegisterPayload?) {
        RNSRegistrationParoleController.initController(item)?.pushAnimatedImageBoard()
    }
}
