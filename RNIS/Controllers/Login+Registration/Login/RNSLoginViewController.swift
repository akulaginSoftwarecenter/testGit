//
//  RNSLoginViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер авторизации
 */
class RNSLoginViewController: UIViewController {
    
    /// Кнопка входа
    @IBOutlet weak var loginButton: RNSBlackButton!
    /// Кнопка возврата
    @IBOutlet weak var backButton: RNSBlackButton!
    /// Представление для авторизации
    @IBOutlet var loginView: RNSLoginView!
    /// Поле ввода логина
    @IBOutlet weak var loginField: RNSPhoneField!
    /// Поле ввода пароля
    @IBOutlet weak var passwordField: STPasswordField!
    /// Надпись с текстом ошибки
    @IBOutlet weak var errorLabel: UILabel!
    var handlerBack: EmptyBlock? = nil
    
    /// Данные пользователя
    var item: RNSUserPayload?
    
    /// Массив текстовых полей
    lazy var fields:[RNSTextField] = {
        return [self.loginField, self.passwordField]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
             
        loginView.blackButton.isHidden = true
        prepareButtons()
        prepareLoginIfNeed()
        addDoneButtonOnKeyboard()
    }
    
    /// Событие нажатия на кнопку входа
    func loginPressed() {
        
        if let error = fields.checkValidFields {
            prepareError(error)
            return
        }
        clearError()
        
        guard let password = passwordField.text else {
            return
        }
        let login = "+7" + loginField.last10
        
        UserDefaults.setLogin(login)
        UserDefaults.setPassword(password)
        
        RNISAuthManager.login(login, password: password, success: { [weak self] in
            STRouter.popMain()
        self?.handlerBack?()
        }, failure:{[weak self] (errorText) in
            self?.prepareError(errorText)
        })
    }
}
