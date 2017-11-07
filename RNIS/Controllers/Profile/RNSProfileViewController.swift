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
    
    @IBOutlet weak var galkaName: UIButton!
    @IBOutlet weak var galkaEmail: UIButton!
    
    /// Модель профиля пользователя
    var item: RNSUserPayload?
    
    var nameText: String? {
        return nameField.text
    }
    
    var emailText: String? {
        return emailField.text
    }
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
    }
    
    override class var storyboardName: String {
        return "RNSProfileViewController"
    }
    
    deinit {
        print("RNSProfileViewController deinit")
    }
}
