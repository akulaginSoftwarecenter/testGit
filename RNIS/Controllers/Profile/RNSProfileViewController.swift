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
    @IBOutlet weak var phoneField: RNSPhoneField!
    @IBOutlet weak var blackButton: RNSBlackButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareStubText()
        prepareBlackButton()
    }
    
    func prepareBlackButton() {
        blackButton.handlerAction = { [weak self] in
            self?.showAlert()
        }
    }
    
    func prepareStubText() {
        nameField.text = "Артем Кулагин"
        emailField.text = "akula_84@mail.ru"
        phoneField.text = "89136298659"
        phoneField.textFieldDidChange()
    }
    
    override class var storyboardName: String {
        return "RNSProfileViewController"
    }
    
    deinit {
        print("RNSProfileViewController deinit")
    }
}
