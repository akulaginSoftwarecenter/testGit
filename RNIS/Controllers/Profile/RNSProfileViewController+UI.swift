//
//  RNSProfileViewController+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSProfileViewController {
    
    /// Очистка представлений
    func clearAll() {
        profilePhoto.imageView.image = nil
        nameField.text = ""
        phoneField.text = ""
        emailField.text = ""
        errorLabel.text = ""
    }
     
    /// Обновление представлений
    ///
    /// - Parameter item: модель профиля
    func updateUI(_ item: RNSUserPayload?) {
        self.item = item
        nameField.text = item?.name
        phoneField.text = item?.formatPhone
        emailField.text = item?.email
        
        decodeImage()
    }
    
    /// Показать алерт с указанным текстом
    ///
    /// - Parameter message: текст
    func showAlertOk(_ message: String?) {
        STAlertRouter.showAlertOk(message)
    }
    
    func prepareError(_ error: String?) {
        errorLabel.text = error
    }
}
