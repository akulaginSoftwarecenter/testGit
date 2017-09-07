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

    override func actionComplete(_ item: RNSRegisterPayload?) {
        RNSRecoveryCodeController.initController(item)?.pushAnimatedImageBoard()
    }
}
