//
//  RNSProfileImageView.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSProfilePhoto: BaseViewWithXIBInit {

    @IBInspectable var colorImageView: UIColor?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    
    var isChange = false
     
    var isHavePhoto: Bool {
        return imageView.image != nil
    }
    
    var handlerUpdateImage: EmptyBlock?
    
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
       let vc = RNSAlertPhotoController.controller(isHavePhoto, complete: showImagePicker, handlerRemove:removePhoto)
       vc.popoverPresentationController?.sourceView = self
       vc.popoverPresentationController?.sourceRect = self.bounds
       STRouter.present(vc)
    }

    func removePhoto() {
        prepareImage(nil)
    }
    
    var imageData: String {
        guard let image = imageView.image else {
            return ""
        }
        let imageData = UIImageJPEGRepresentation(image, 0.1)!
        return imageData.base64EncodedString()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        imageView.layer.cornerRadius =  frame.width/2
        backImage.layer.cornerRadius =  frame.width/2
    }
}
