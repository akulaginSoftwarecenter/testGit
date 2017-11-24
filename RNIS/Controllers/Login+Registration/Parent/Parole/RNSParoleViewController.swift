//
//  RNSParoleViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер создания пароля
 */
class RNSParoleViewController: RNSCoverViewController, ContainerProtocol {
    
    /// Поле ввода пароля
    @IBOutlet weak var passwordOneField: STPasswordField!
    /// Поле подтверждения пароля
    @IBOutlet weak var passwordTwoField: STPasswordField!
    /// Заполнитель поля пароля
    var placeholderPassworOne: String?
    /// Заголовок кнопки перехода к следующему шагу
    var titleBlackButton: String?
    
    /// Массив текстовых полей
    lazy var fields:[RNSTextField] = {
        return [self.passwordOneField, self.passwordTwoField]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        addDoneButtonOnKeyboard()
    }
   
    override func loginPressed() {
        if let error = fields.checkValidFields {
            errorLabel.text = error
            return
        }
        
        if passwordOneField.text !=  passwordTwoField.text {
            errorLabel.text = "Пароли не совпадают"
            passwordOneField.setStateNotValid()
            passwordTwoField.setStateNotValid()
            return
        }
        
        if let parent = self.parent as? RNSParoleContainerController,
            let phone = parent.item?.phone,
            phone == passwordOneField.text {
            errorLabel.text = "Пароль не может полностью повторять логин"
            passwordOneField.setStateNotValid()
            passwordTwoField.setStateNotValid()
            return
        }
        
        clearError()
        handlerBlackAction?()
    }
    
    /// Очистка надписей для ошибок
    func clearError() {
        fields.clearError()
        errorLabel.text = nil
    }
}
