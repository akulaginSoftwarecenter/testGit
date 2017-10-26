//
//  RNSChangePasswordController.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер для изменения пароля
 */
class RNSChangePasswordController: UIViewController {

    /// Фоновое представление для регистрации и входа
    @IBOutlet var coverView: RNSLoginView!
    /// Поле для ввода старого пароля
    @IBOutlet weak var passwordOldField: STPasswordField!
    /// Поле для ввода нового пароля
    @IBOutlet weak var passwordOneField: STPasswordField!
    /// Поля для ввода нового пароля повторно
    @IBOutlet weak var passwordTwoField: STPasswordField!
    /// Надпись для отображения ошибок
    @IBOutlet weak var errorLabel: UILabel!
    
    /// Массив полей для ввода
    @IBOutlet var fields: [STPasswordField]!
    
    /// Данные профиля пользователя
    var item: RNSUserPayload?
    
    /// Загрузка профиля пользователя
    func loadData() {
        STRouter.showLoader()
        RNSPostUserGet {[weak self] (reply, error, _) in
            self?.item = reply as? RNSUserPayload
            STRouter.removeLoader()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        prepareCoverView()
        addDoneButtonOnKeyboard()
    }
    
    /// Настройка фонового представления
    func prepareCoverView() {
        coverView.handlerBlackAction = { [weak self] in
            self?.savePressed()
        }
    }

    /// Добавить кнопку "готово" на клавиатуру
    func addDoneButtonOnKeyboard()  {
        passwordOldField.addButtonOnKeyboard("Далее   ", target: passwordOneField, action: #selector(UIResponder.becomeFirstResponder))
        passwordOneField.addButtonOnKeyboard("Далее   ", target: passwordTwoField, action: #selector(UIResponder.becomeFirstResponder))
        passwordTwoField.addButtonOnKeyboard("Далее   ", target: self, action: #selector(savePressed))
    }
    
    /// Текст старого пароля
    var passwordOld: String? {
        return passwordOldField.text
    }
    
    /// Событие нажатия на кнопку "сохранить"
    @objc func savePressed() {
        if let error = fields.checkValidFields {
            prepareError(error)
            return
        }
        
        if passwordOneField.text !=  passwordTwoField.text {
            prepareError("Пароли не совпадают")
            passwordOneField.setStateNotValid()
            passwordTwoField.setStateNotValid()
            return
        }
        
        clearError()
        actionNext()
    }
    
    /// Отправка нового пароля на сервер
    func actionNext() {
        item?.password = passwordTwoField.text
        item?.old_password = passwordOld
        item?.new_email = nil  // Don't re-send new email parameter on next update profile request
        
        RNSPostUpdate(item, complete: { [weak self] item in
            self?.pop()
        }, failure: { [weak self] error in
            self?.prepareError(error)
        })
    }
    
    func prepareError(_ error: String?) {
        errorLabel.text = error
    }
    
    /// Выход из контроллера
    func pop() {
        STRouter.pop { 
            STRouter.showAlertOk("Ваш пароль успешно изменён")
        }
    }
    
    /// Очистка полей с ошибками
    func clearError() {
        fields.clearError()
        prepareError(nil)
    }
    
    override class var storyboardName: String {
        return "RNSChangePasswordController"
    }
}
