//
//  RNSRegistrationCodeController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRegistrationCodeController: RNSCodeContainerController {
    
    var item: RNSRegisterPayload?
    
    static func initController(_ item: RNSRegisterPayload?) -> UIViewController? {
        let vc = RNSRegistrationCodeController.controller as? RNSRegistrationCodeController
        vc?.item = item
        vc?.phone = item?.phone
        return vc
    }
    
    override var typeTitle: TypeTitle {
        return .registration
    }
    
    override func actionNext() {
        item?.phone_activation_code = codeText
        
        RNSPostConfirmCheck(item, complete: {
            RNSRegistrationParoleController.initController($0)?.pushAnimatedImageBoard()
        }, failure: { [weak self] error in
            self?.prepareError(error)
        })
     }
    
    func prepareError(_ error: String?) {
        containerViewController?.errorLabel.text = error
    }
    
    override func repeatCodeAction() {
        item?.confirmSend()
    }
}
