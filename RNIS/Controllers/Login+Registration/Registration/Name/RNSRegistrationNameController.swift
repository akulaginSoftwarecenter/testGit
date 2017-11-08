//
//  RNSRegistrationNameController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

import Alamofire
import ObjectMapper

/**
 Контроллер регистрации имени пользователя
 */
class RNSRegistrationNameController: UIViewController {
    
    /// Поле ввода имени
    @IBOutlet weak var nameField: RNSTextField!
    /// Фоновое представление для регистрации и входа
    @IBOutlet var coverView: RNSLoginView!
    /// Надпись с текстом ошибки
    @IBOutlet weak var errorLabel: UILabel!
    /// Представление, содержащее фото пользователя с возможностью редактирования
    @IBOutlet weak var photo: RNSProfilePhoto!
    /// Блок для обработки изменения позиции контента
    var handlerUpdateScroll: ((CGFloat) -> ())?
    /// Данные пользователя
    var item: RNSUserPayload?

    /// Создание контроллера
    ///
    /// - Parameter item: данные пользователя
    static func initController(_ item: RNSUserPayload?) -> UIViewController? {
        let vc = RNSRegistrationNameController.initialController as? RNSRegistrationNameController
        
        let container = STRouter.scrollContainer(vc)
        vc?.handlerUpdateScroll = {
            container?.prepareContentY($0)
        }
        vc?.item = item
        return STRouter.imageContainer(container)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCoverView()
        nameField.addButtonOnKeyboard("Далее   ", target: self, action: #selector(buttonPressed))
    }
    
    /// Настройка фонового представления для регистрации и входа
    func prepareCoverView() {
        coverView.handlerBlackAction = { [weak self] in
            self?.buttonPressed()
        }
    }
    
    /// Событие нажатия кнопки "Далее" на клавиатуре поля имени
    @objc func buttonPressed() {
        if !nameField.isValid {
            nameField.setStateNotValid()
            prepareError("Введите имя")
            return
        }
        clearError()
        send()
    }
    
    /// Регистрация имени и аватара пользователя на сервере с последующей авторизацией в случае успеха
    func send() {
        item?.name = nameField.text
        item?.avatar = photo.imageData

        RNSPostUpdate(item, complete: {[weak self] _ in
            self?.login()
            }, failure: { [weak self] error in
                self?.prepareError(error)
        })
    }
    
    /// Авторизация пользователя
    func login() {
        RNISAuthManager.login(item?.phone, password: item?.password) {[weak self] (errorText) in
            self?.prepareError(errorText)
        }
    }
    
    /// Заполнение надписи для демонстрации ошибок текстом ошибки
    ///
    /// - Parameter error: текст ошибки
    func prepareError(_ error: String?) {
        errorLabel.text = error
    }
    
    /// Очистка надписи для демонстрации ошибок
    func clearError() {
        nameField.setStateValid()
        prepareError(nil)
    }
   
    override class var storyboardName: String {
        return "RNSRegistrationNameController"
    }
}
