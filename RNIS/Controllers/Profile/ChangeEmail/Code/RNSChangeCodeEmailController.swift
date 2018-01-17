//
//  RNSChangeCodeEmailController.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit
/**
 Контроллер ввода кода подтверждения при изменении пароля
 */
class RNSChangeCodeEmailController: RNSCodeMailContainerController {
    
    /// Создание контроллера
    ///
    /// - Parameter item: модель профиля пользователя
    static func initController(_ item: RNSUserPayload?) -> UIViewController? {
        let vc = RNSChangeCodeEmailController.controllerType()
        
        let container = STRouter.scrollContainer(vc)
        vc?.handlerUpdateScroll = {
            container?.prepareContentY($0)
        }
        vc?.item = item
        return STRouter.imageContainer(container)
    }
    
    override func prepareEmailText() {
        containerViewController?.email = item?.new_email
    }
    
    override var typeTitle: TypeTitle {
        return .changeEmail
    }
    /*
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
    */
    /// Выход из контроллера с последующей демонстрацией сообщения об успешном изменении почта
    func popAlert() {
        RNSMenuManager.leftMenuUpdate()
        STRouter.popToRootMain(false) {
            STAlertRouter.showOk("Email успешно изменён")
        }
    }
}
