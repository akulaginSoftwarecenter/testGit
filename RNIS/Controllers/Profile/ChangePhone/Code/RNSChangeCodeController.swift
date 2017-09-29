//
//  RNSChangeCodeController.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSChangeCodeController: RNSCodeContainerController {
    
    static func initController(_ item: RNSUserPayload?) -> UIViewController? {
        let vc = RNSChangeCodeController.controller as? RNSChangeCodeController
        
        let container = STRouter.scrollContainer(vc)
        vc?.handlerUpdateScroll = {
            container?.prepareContentY($0)
        }
        vc?.item = item
        return STRouter.imageContainer(container)
    }
    
    override func preparePhoneText() {
        containerViewController?.phone = item?.new_phone
    }
    
    override var typeTitle: TypeTitle {
        return .change
    }
    
    override func repeatCodeAction() {
        item?.phoneConfirmSend()
    }
    
    override func actionNext() {
        item?.new_phone_activation_code = codeText
        RNSPostPhoneConfirmCheck(item, complete: { [weak self] item in
            self?.popAlert()
            }, failure: { [weak self] error in
                self?.prepareError(error)
        })
    }
    
    func popAlert() {
        RNSMenuManager.leftMenuUpdate()
        STRouter.pop(animated: false) {
            STRouter.pop(animated: false) {
                STRouter.showAlertOk("Номер телефона успешно изменён")
            }
        }
    }
}
