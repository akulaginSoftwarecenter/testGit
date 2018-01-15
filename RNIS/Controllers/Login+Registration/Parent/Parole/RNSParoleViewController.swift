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
        if showFirstErrorAlert() {
            return
        }
        
        if passwordOneField.text !=  passwordTwoField.text {
            passwordNoValidBecome("Пароли не совпадают")
            return
        }
        
        if let parent = self.parent as? RNSParoleContainerController,
            let phone = parent.item?.phone,
            phone == passwordOneField.text {
            passwordNoValidBecome("Пароль не может полностью повторять логин")
            return
        }
        
        clearError()
        handlerBlackAction?()
    }
    
    func passwordNoValidBecome(_ text: String?) {
        prepareError(text) { [weak self] in
            self?.passwordOneField.setStateNotValid()
            self?.passwordTwoField.setStateNotValid()
            self?.passwordTwoField.becomeFirstResponder()
        }
    }
    
    @discardableResult func showFirstErrorAlert() -> Bool {
        return fields.showFirstErrorAlert
    }
    
    /// Очистка надписей для ошибок
    func clearError() {
        fields.clearError()
        prepareError(nil)
    }
    
    func prepareError(_ error: String?, handler: EmptyBlock? = nil) {
        guard let error = error, !error.isEmpty else {
            return
        }
        STAlertRouter.showOk(error, handler: handler)
    }
}
