//
//  RNSCodeMailContainerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер, который является контейнером для контроллера RNSCodeViewController
 */
class RNSCodeMailContainerController: STContainerViewController {
    /// Хранит данные пользователя
    var item: RNSUserPayload?
    
    /// Внутренний контроллер
    var containerViewController: RNSCodeEmailViewController? {
        return (enterViewController as? RNSCodeEmailViewController)
    }
    
    /// Обработчик изменений позиции контента скролинга
    var handlerUpdateScroll: ((CGFloat) -> ())?
    
    override func prepareEnterViewController(){
        super.prepareEnterViewController()
        containerViewController?.handlerRepeatCode = { [weak self] in
            self?.repeatCodeAction()
        }
        prepareEmailText()
    }
    
    /// Подготовка текста номера телефона к использованию в контейнере
    func prepareEmailText() {
        containerViewController?.email = item?.email
    }
    
    /// Текст кода подтверждения из внутреннего контроллера
    var codeText: String? {
        return containerViewController?.codeField.text
    }
    
    /// Отправить код потдверждения на устройство повторно
    func repeatCodeAction() {
        item?.confirmEmailSend()
    }
    
    override func actionNext() {
        
        item?.email_activation_code = codeText
        RNSEmailConfirmCheck(item, complete: { [weak self] item in
            self?.actionComplete(item)
            }, failure: { [weak self] error in
                self?.prepareError(error)
        })
    }
    
    /// Событие успешного завершения проверки кода подтверждения
    ///
    /// - Parameter item: Содержит информацию о пользователе
    func actionComplete(_ item: RNSUserPayload?) {
        
    }
    
    func prepareError(_ error: String?) {
        containerViewController?.errorLabel.text = error
        containerViewController?.codeField.text = ""
    }
    
    override class var storyboardName: String {
        return kCodeEmailVC
    }
    
    deinit {
        NotificationCenter.removeObserver(self)
    }
}
