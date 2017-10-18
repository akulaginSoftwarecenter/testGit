//
//  RNSProfilePhoto+ImagePicker.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Profile Photo + Image Picker
 */


extension RNSProfilePhoto {
    
    func showImagePicker(_ type: UIImagePickerControllerSourceType) {
        if UIImagePickerController.isSourceTypeAvailable(type) {
            let vc = RNSImagePickerController(complete: prepareImage)
            vc.sourceType = type
            STRouter.present(vc)
        } else {
            STRouter.showAlertOk("ACCESS DENIED")
        }
    }
    
    func prepareImage(_ image: UIImage?) {
        imageView.image = image
        isChange = true
        handlerUpdateImage?()
    }
}
