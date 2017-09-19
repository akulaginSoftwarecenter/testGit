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
    @IBInspectable var colorImageView: UIColor?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    
    var isHavePhoto: Bool {
        return photo != nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareColorImageView()
    }
    
    func prepareColorImageView() {
        guard let color = colorImageView else {
            return
        }
        backImage.backgroundColor = color
    }
    
    @IBAction func actionButton(_ sender: Any) {
        RNSAlertPhotoController.controller(isHavePhoto, complete: showImagePicker, handlerRemove:removePhoto)
    }

    func removePhoto() {
        photo = nil
        imageView.image = nil
    }
    
    var imageData: String? {
        /*
        guard let image = imageView.image else {
            return nil
        }
        */
        let imageData = UIImageJPEGRepresentation(#imageLiteral(resourceName: "EmptyPhoto"), 0.1)!
       // return imageData.base64EncodedString()
        return imageData.base64EncodedString()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        imageView.layer.cornerRadius =  frame.width/2
        backImage.layer.cornerRadius =  frame.width/2
    }
}
