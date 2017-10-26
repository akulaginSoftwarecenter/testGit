//
//  RNSProfileImageView.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Представление для отображения и редактирования аватара пользователя
 */
class RNSProfilePhoto: BaseViewWithXIBInit {

    @IBInspectable var colorImageView: UIColor?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    
    /// Показывает изменялось ли представление
    var isChange = false
     
    /// Показывает имеется ли фото
    var isHavePhoto: Bool {
        return imageView.image != nil
    }
    
    /// Блок обновления фото
    var handlerUpdateImage: EmptyBlock?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareColorImageView()
    }
    
    /// Настройка представления
    func prepareColorImageView() {
        guard let color = colorImageView else {
            return
        }
        backImage.backgroundColor = color
    }
    
    /// Событие нажатия на представление
    @IBAction func actionButton(_ sender: Any) {
       let vc = RNSAlertPhotoController.controller(isHavePhoto, complete: showImagePicker, handlerRemove:removePhoto)
       vc.popoverPresentationController?.sourceView = self
       vc.popoverPresentationController?.sourceRect = self.bounds
       STRouter.present(vc)
    }

    /// Удаление фото
    func removePhoto() {
        prepareImage(nil)
    }
    
    /// Кодирование фото в формат base64
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
