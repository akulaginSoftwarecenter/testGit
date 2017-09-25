//
//  RNSProfileViewController+Image.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSProfileViewController {
    
    func prepareProfilePhoto() {
        profilePhoto.handlerUpdateImage = { [weak self] in
            self?.updateProfilePhoto()
        }
    }
    
    func updateProfilePhoto() {
        item?.avatar = profilePhoto.imageData
        updateItem()
    }
    
    func decodeImage() {
        item?.loadImage { [weak self] image in
            self?.profilePhoto.imageView.image = image
        }
    }
}
