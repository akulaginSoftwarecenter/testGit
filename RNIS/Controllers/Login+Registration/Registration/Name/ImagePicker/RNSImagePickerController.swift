//
//  RNSImagePickerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер для просмотра и последующего выбора фотографий из галереи
 */
class RNSImagePickerController: UIImagePickerController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    /// Обработчик, который вызывается после выбора фото из галереи
    var complete: AliasImageBlock?
    
    /// Вспомогательный инициализатор для создания контроллера с помощью блока-обработчика выбора фото
    ///
    /// - Parameter complete: блок, которые будет вызван после выбора фото
    convenience init(complete: AliasImageBlock?) {
        self.init()
        
        self.complete = complete
    }
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        allowsEditing = true
    }
    
    /// Событие выбора фотографии из галереи
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            complete?(image)
        } else{
            print("Something went wrong")
        }
        dismiss()
    }
    
    /// Событие отмены выбора фотографии
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss()
    }
    
    func dismiss() {
        self.dismiss(animated: true)
    }
}
