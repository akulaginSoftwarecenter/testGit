//
//  RNSChangeCodeController.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер ввода кода подтверждения при изменении пароля
 */
class RNSChangeCodeController: RNSCodeContainerController {
    
    /// Создание контроллера
    ///
    /// - Parameter item: модель профиля пользователя
    static func initController(_ item: RNSUserPayload?) -> UIViewController? {
        let vc = RNSChangeCodeController.controllerType()
        
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
    
    /// тип заголовка "Регистрация" "Восстановление пароля" "Сменить номер" "Сменить email"
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
    
    /// Выход из контроллера с последующей демонстрацией сообщения об успешном изменении телефона
    func popAlert() {
        RNSMenuManager.leftMenuUpdate()
        STRouter.popToRootMain(false) {
            STAlertRouter.showOk("Номер телефона успешно изменён")
        }
    }
}
