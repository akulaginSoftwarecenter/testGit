//
//  RNSEmailContainerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер, который является контейнером для контроллера RNSPhoneViewController
 */
class RNSEmailContainerController: STContainerViewController {

    
    /// Внутренний контроллер
    var containerViewController: RNSEmailViewController? {
        return (enterViewController as? RNSEmailViewController)
    }
    
    /// Текст номера телефона из внутреннего контроллера
    var emailText: String? {
        return (enterViewController as? RNSEmailViewController)?.emailField.text
    }
    
    /// Текст заполнителя для поля номера телефона во внутреннем контроллере
    var placeHolderEmailField: String? {
        return nil
    }
    
    /// Заголовок кнопки возврата внутреннего контроллера
    var titleBackButton: String? {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareEmailField()
        prepareBackButton()
    }
    
    /// Настройка поля с номером телефона внутреннего контроллера
    func prepareEmailField() {
        guard let text = placeHolderEmailField else {
            return
        }
        containerViewController?.emailField.placeholderKey = text
    }
    
    /// Настройка кнопки возврата внутреннего контроллера
    func prepareBackButton() {
        guard let text = titleBackButton else {
            return
        }
        containerViewController?.backButton.title = text
    }
    
    override func actionNext() {
        let item = RNSUserPayload(email: emailText)
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
        containerViewController?.prepareError(error)
    }
    
    override class var storyboardName: String {
        return kEmailVC
    }
}
