//
//  RNSProfilePhoto+ImagePicker.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с пикером
 */
extension RNSProfilePhoto {
    
    /// Показать пикер
    func showImagePicker(_ type: UIImagePickerControllerSourceType) {
        if UIImagePickerController.isSourceTypeAvailable(type) {
            let vc = RNSImagePickerController(complete: prepareImage)
            vc.sourceType = type
            STRouter.present(vc)
        } else {
            STAlertRouter.showOk("ACCESS DENIED")
        }
    }
    
    /// Настройка фото
    ///
    /// - Parameter image: фото
    func prepareImage(_ image: UIImage?) {
        imageView.image = image
        isChange = true
        handlerUpdateImage?()
    }
}
