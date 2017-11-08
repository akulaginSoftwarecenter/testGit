//
//  RNSCodeViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер для ввода кода подтверждения
 */
class RNSCodeViewController: RNSCoverViewController,ContainerProtocol {
    
    /// Поле кода подтверждения
    @IBOutlet weak var codeField: RNSTextField!
    /// Надпись с номером телефона
    @IBOutlet weak var phoneLabel: UILabel!
    /// Кнопка повторной отправки кода подтверждения
    @IBOutlet weak var repeatButton: UIButton!
    
    /// Обработчик повторной отправки кода
    var handlerRepeatCode: EmptyBlock?
    /// Текст номера телефона
    var phone: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        preparePhone()
        codeField.addButtonOnKeyboard("Далее   ", target: self, action: #selector(loginPressed))
    }
    
    /// Подготовка текста номера телефона
    func preparePhone() {
        guard let phone = phone else {
            return
        }
        phoneLabel.text = InputFieldsValidator.format(phone).text
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
    
    override class var storyboardName: String {
        return kCodeVC
    }
}
