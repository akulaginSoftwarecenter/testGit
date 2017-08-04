//
//  RNSProfileViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSProfileViewController: UIViewController {
    @IBOutlet weak var nameField: RNSNameField!
    @IBOutlet weak var emailField: RNSEmailField!
    
    static func initController() -> UIViewController? {
        return STRouter.redContainer(STRouter.boardContainer(RNSProfileViewController.initialController))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.text = "Артем Кулагин"
        emailField.text = "akula_84@mail.ru"
    }
    
    override class var storyboardName: String {
        return "RNSProfileViewController"
    }
}
