//
//  RNSCodeContainerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер, который является контейнером для контроллера RNSCodeViewController
 */
class RNSCodeContainerController: STContainerViewController {
   
   /// Хранит данные пользователя
   var item: RNSUserPayload?
    
   /// Внутренний контроллер
   var containerViewController: RNSCodeViewController? {
        return (enterViewController as? RNSCodeViewController)
   }
    
   /// Обработчик изменений позиции контента скролинга
   var handlerUpdateScroll: ((CGFloat) -> ())?
    
   override func prepareEnterViewController(){
        super.prepareEnterViewController()
        containerViewController?.handlerRepeatCode = { [weak self] in
            self?.repeatCodeAction()
        }
        preparePhoneText()
    }
    
    /// Подготовка текста номера телефона к использованию в контейнере
    func preparePhoneText() {
        containerViewController?.phone = item?.phone
    }
   
    /// Текст кода подтверждения из внутреннего контроллера
    var codeText: String? {
        return containerViewController?.codeField.text
    }
    
    /// Отправить код потдверждения на устройство повторно
    func repeatCodeAction() {
        item?.confirmSend()
    }
    
    override func actionNext() {
        item?.phone_activation_code = codeText
        RNSPostConfirmCheck(item, complete: { [weak self] item in
            self?.actionComplete(item)
        }, failure: { [weak self] error in
            self?.prepareError(error)
        })
    }
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return kCodeVC
    }
    
    deinit {
        NotificationCenter.removeObserver(self)
    }
}
