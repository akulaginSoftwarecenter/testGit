//
//  RNSRegistrationEmailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRegistrationEmailController: RNSEmailContainerController {

    override var typeTitle: TypeTitle {
        return .registration
    }
    
    override func actionComplete(_ item: RNSUserPayload?) {
        RNSPostRegister(item, complete: {
            STRouter.pushMain(RNSRegistrationCodeController.initController($0))
        }, failure: { [weak self] error in
            self?.prepareError(error)
        })
    }
}
