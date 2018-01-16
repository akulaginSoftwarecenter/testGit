//
//  RNSEmailViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSEmailViewController: RNSCoverViewController, ContainerProtocol {
    /// Поле номера телефона
    @IBOutlet weak var emailField: RNSEmailField!
    /// Кнопка возврата
    @IBOutlet weak var backButton: RNSGrayBackButton!
    
    /// Массив текстовых полей
    lazy var fields:[RNSTextField] = {
        return [self.emailField]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDoneButtonOnKeyboard()
    }
    
    /// Событие нажатия на кнопку перехода к следующему шагу
    override func loginPressed() {
        if fields.showFirstErrorAlert {
            return
        }
        clearError()
        handlerBlackAction?()
    }
    
    /// Метод добавления кнопки "Готово" на клавиатуру для поля номера телефона
    func addDoneButtonOnKeyboard()  {
        emailField.addButtonOnKeyboard("Далее   ", target: self, action: #selector(self.loginPressed))
    }
    
    /// Метод очистки надписей с ошибками
    func clearError() {
        fields.clearError()
        prepareError(nil)
    }
    
    func prepareError(_ error: String?) {
        guard let error = error, !error.isEmpty else {
            return
        }
        STAlertRouter.showOk(error)
    }

}
