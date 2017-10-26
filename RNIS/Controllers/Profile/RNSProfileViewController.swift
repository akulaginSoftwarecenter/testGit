//
//  RNSProfileViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер редактирования профиля пользователя
 */
class RNSProfileViewController: UIViewController {
    
    /// Поле редактирования имени
    @IBOutlet weak var nameField: RNSNameField!
    /// Поле редактирования почты
    @IBOutlet weak var emailField: RNSEmailField!
    /// Поле телефона
    @IBOutlet weak var phoneField: RNSPhoneField!
    /// Кнопка выхода из аккаунта
    @IBOutlet weak var blackButton: RNSBlackButton!
    /// Надпись с текстом ошибки
    @IBOutlet weak var errorLabel: UILabel!
    /// Представление для демонстрации автара пользователя с возможностью редактирования
    @IBOutlet weak var profilePhoto: RNSProfilePhoto!
    
    /// Модель профиля пользователя
    var item: RNSUserPayload?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        prepareBlackButton()
        prepareProfilePhoto()
        prepareHandlers()
    }
    
    /// Настройка обработчика очищения профиля
    func prepareHandlers() {
        RNSMenuManager.handlerClearProfile = {[weak self] in
            self?.clearAll()
        }
    }
    
    /// Настройка кнопки выхода
    func prepareBlackButton() {
        blackButton.handlerAction = { [weak self] in
            self?.showAlert()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
    }
    
    /// Очистка представлений
    func clearAll() {
        profilePhoto.imageView.image = nil
        nameField.text = ""
        phoneField.text = ""
        emailField.text = ""
        errorLabel.text = ""
    }
    
    /// Загрузка данных профиля пользователя
    func loadData() {
        STRouter.showLoader()
        RNSPostUserGet {[weak self] (reply, error, _) in
            self?.updateUI(reply as? RNSUserPayload)
            STRouter.removeLoader()
        }
    }
    
    /// Обновление представлений
    ///
    /// - Parameter item: модель профиля
    func updateUI(_ item: RNSUserPayload?) {
        self.item = item
        nameField.text = item?.name
        phoneField.text = item?.formatPhone
        emailField.text = item?.email
        self.item?.new_email = nil  // Remove new_email from update profile payload
        decodeImage()
    }
    
    override class var storyboardName: String {
        return "RNSProfileViewController"
    }
    
    deinit {
        print("RNSProfileViewController deinit")
    }
}
