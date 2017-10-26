//
//  RNSProfileViewController+Image.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение для работы с аватаром
extension RNSProfileViewController {
    
    /// Настройка обработчика обновления аватара
    func prepareProfilePhoto() {
        profilePhoto.handlerUpdateImage = { [weak self] in
            self?.updateProfilePhoto()
        }
    }
    
    /// Обновление аватара
    func updateProfilePhoto() {
        item?.avatar = profilePhoto.imageData
        updateItem()
    }
    
    /// Декодировка аватара из формата base64 и последующая установка в представление
    func decodeImage() {
        item?.loadImage { [weak self] image in
            self?.profilePhoto.imageView.image = image
        }
    }
}
