//
//  RNSRecoveryCodeController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRecoveryCodeController: RNSCodeContainerController {
    
    static func initController(_ item: RNSUserPayload?) -> UIViewController? {
        let vc = RNSRecoveryCodeController.controller as? RNSRecoveryCodeController
        vc?.item = item
        return vc
    }
  
    override var typeTitle: TypeTitle {
        return .recovery
    }
    
    override func actionComplete(_ item: RNSUserPayload?) {
        RNSRecoveryParoleController.initController(item)?.pushAnimatedImageBoard()
    }
}
