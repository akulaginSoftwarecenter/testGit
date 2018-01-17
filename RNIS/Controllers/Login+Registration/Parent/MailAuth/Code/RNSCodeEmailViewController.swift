//
//  RNSCodeEmailViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSCodeEmailViewController: RNSCoverViewController,ContainerProtocol {
    /// Поле кода подтверждения
    @IBOutlet weak var codeField: RNSTextField!
    /// Надпись с номером телефона
    @IBOutlet weak var emailLabel: UILabel!
    /// Кнопка повторной отправки кода подтверждения
    @IBOutlet weak var repeatButton: UIButton!
    
    /// Обработчик повторной отправки кода
    var handlerRepeatCode: EmptyBlock?
    /// Текст номера телефона
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareEmail()
        codeField.addButtonOnKeyboard("Далее   ", target: self, action: #selector(loginPressed))
    }
    
    /// Подготовка текста номера телефона
    func prepareEmail() {
        guard let email = email else {
            return
        }
        emailLabel.text = email
    }
    
    override func loginPressed() {
        if !codeField.isValid {
            codeField.setStateNotValid()
            errorLabel.text = "Введите код"
            return
        }
        clearError()
        handlerBlackAction?()
    }
    
    /// очистка надписей с ошибками
    func clearError() {
        codeField.setStateValid()
        errorLabel.text = nil
    }
    
    /// Событие нажатия на кнопку повторной отправки кода
    @IBAction func repeatCodeAction(_ sender: Any) {
        handlerRepeatCode?()
    }
}
