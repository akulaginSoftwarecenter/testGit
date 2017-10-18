//
//  RNSRecoveryCodeController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 RNSRecoveryCodeController
 */

class RNSRecoveryCodeController: RNSCodeContainerController {
    
    static func initController(_ item: RNSUserPayload?) -> UIViewController? {
        let vc = RNSRecoveryCodeController.controller as? RNSRecoveryCodeController
        
        let container = STRouter.scrollContainer(vc)
        vc?.handlerUpdateScroll = {
            container?.prepareContentY($0)
        }
        vc?.item = item
        return STRouter.imageContainer(container)
    }
  
    override var typeTitle: TypeTitle {
        return .recovery
    }
    
    override func actionComplete(_ item: RNSUserPayload?) {
        RNSRecoveryParoleController.initController(item)?.pushAnimatedImageBoard()
    }
}
