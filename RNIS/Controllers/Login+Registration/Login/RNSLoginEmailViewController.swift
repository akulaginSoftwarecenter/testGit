//
//  RNSLoginEmailViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер авторизации
 */
class RNSLoginEmailViewController: UIViewController {
    
    /// Кнопка входа
    @IBOutlet weak var loginButton: RNSBlackButton!
    /// Кнопка возврата
    @IBOutlet weak var backButton: RNSBlackButton!
    /// Представление для авторизации
    @IBOutlet var loginView: RNSLoginView!
    /// Поле ввода логина
    @IBOutlet weak var loginField: RNSEmailField!
    /// Поле ввода пароля
    @IBOutlet weak var passwordField: STPasswordField!
    /// Надпись с текстом ошибки
    @IBOutlet weak var errorLabel: UILabel!
    
    /// Данные пользователя
    var item: RNSUserPayload?
    
    /// Массив текстовых полей
    lazy var fields:[RNSTextField] = {
        return [self.loginField, self.passwordField]
    }()
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.blackButton.isHidden = true
        prepareButtons()
        addDoneButtonOnKeyboard()
    }
    
    /// Событие нажатия на кнопку входа
    func loginPressed() {
        if showFirstErrorAlert() {
            return
        }
        clearError()
        
        guard let password = passwordField.text,
            let login = loginField.text else {
            return
        }
        
        UserDefaults.setLogin(login)
        UserDefaults.setPassword(password)
        
        RNISAuthManager.loginEmail(login, password: password, success: {
            STRouter.showMapReset()
            }, failure:{[weak self] (errorText) in
                self?.prepareError(errorText)
        })
    }
    
    @discardableResult func showFirstErrorAlert() -> Bool {
        return fields.showFirstErrorAlert
    }
}
