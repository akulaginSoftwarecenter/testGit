//
//  RNSPhoneContrainerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер, который является контейнером для контроллера RNSPhoneViewController
 */
class RNSPhoneContainerController: STContainerViewController {
    
    /// Внутренний контроллер
    var containerViewController: RNSPhoneViewController? {
        return (enterViewController as? RNSPhoneViewController)
    }
    
    /// Текст номера телефона из внутреннего контроллера
    var phoneText: String? {
       return (enterViewController as? RNSPhoneViewController)?.phoneField.last10
    }
    
    /// Текст заполнителя для поля номера телефона во внутреннем контроллере
    var placeHolderPhoneField: String? {
        return nil
    }
    
    /// Заголовок кнопки возврата внутреннего контроллера
    var titleBackButton: String? {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         preparePhoneField()
         prepareBackButton()
    }
    
    /// Настройка поля с номером телефона внутреннего контроллера
    func preparePhoneField() {
        guard let text = placeHolderPhoneField else {
            return
        }
        containerViewController?.phoneField.placeholderKey = text
    }
    
    /// Настройка кнопки возврата внутреннего контроллера
    func prepareBackButton() {
        guard let text = titleBackButton else {
            return
        }
        containerViewController?.backButton.title = text
    }
    
    override func actionNext() {
        let item = RNSUserPayload(phone: "+7" + (phoneText ?? ""))
        actionComplete(item)
    }
    
    /// Событие загорается перед переходом к следующему шагу.
    /// Это значит, что пользователь завершил ввод номера телефона и нажал на кнопку перехода к следующему шагу.
    /// Контроллер завершил обработку его действий и готов выполнить переход.
    ///
    /// - Parameter item: Объект RNSUserPayload, содержит результат ввода пользователем информации о номере телефона
    func actionComplete(_ item: RNSUserPayload?) {

    }
    
    /// Настройка надписи, которая отображает ошибки
    ///
    /// - Parameter error: текст ошибки
    func prepareError(_ error: String?) {
        containerViewController?.errorLabel.text = error
    }
    
    
    override class var storyboardName: String {
        return kPhoneVC
    }
}
