//
//  RNSProfileImageView.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSProfilePhoto: BaseViewWithXIBInit {

    var photo: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    var isHavePhoto: Bool {
        return photo != nil
    }
    
    @IBAction func actionButton(_ sender: Any) {
        RNSAlertPhotoController.controller(isHavePhoto, complete: showImagePicker, handlerRemove:removePhoto)
    }

    func removePhoto() {
        photo = nil
        imageView.image = #imageLiteral(resourceName: "EmptyPhoto")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        imageView.layer.cornerRadius =  frame.width/2
    }
}
