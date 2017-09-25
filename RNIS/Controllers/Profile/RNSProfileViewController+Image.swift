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
        guard let imageData = profilePhoto.imageData else {
            return
        }
        print("updateProfilePhoto")
        item?.avatar = imageData
        updateItem()
    }
}
