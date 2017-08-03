//
//  RNSRegistrationNameController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRegistrationNameController: UIViewController {
    
    var photo: UIImage?
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.layer.cornerRadius =  imageView.frame.width/2
    }
    
    override class var storyboardName: String {
        return "RNSRegistrationNameController"
    }
}
