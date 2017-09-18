//
//  RNSRecoveryPhoneController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRecoveryPhoneController: RNSPhoneContrainerController {
    
    override var typeTitle: TypeTitle {
        return .recovery
    }

    override func actionComplete(_ item: RNSUserPayload?) {
        RNSPostConfirmSend(item, complete: {
            RNSRecoveryCodeController.initController($0)?.pushAnimatedImageBoard()
        }, failure: {[weak self] item in
            self?.prepareError(item)
        })
    }
}
