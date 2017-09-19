//
//  RNSImagePickerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSImagePickerController: UIImagePickerController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var complete: AliasImageBlock?
    
    convenience init(complete: AliasImageBlock?) {
        self.init()
        
        self.complete = complete
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        allowsEditing = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            complete?(image)
        } else{
            print("Something went wrong")
        }
        dismiss()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss()
    }
    
    func dismiss() {
        self.dismiss(animated: true)
    }
}
