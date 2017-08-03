//
//  RNSLoginViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSLoginViewController: UIViewController {
    
    @IBOutlet var loginView: RNSLoginView!
    @IBOutlet weak var loginField: RNSPhoneField!
    @IBOutlet weak var passwordField: STPasswordField!
    @IBOutlet weak var errorLabel: UILabel!
    
    lazy var fields:[RNSTextField] = {
        return [self.loginField, self.passwordField]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.handlerBlackAction = { [weak self] in
            self?.loginPressed()
        }
        
        stubLogin()
    }
    
    func stubLogin() {
        loginField.text = "79136298659"
        loginField.textFieldDidChange()
        passwordField.text = "111111"
    }
    
    func loginPressed() {
        if let error = fields.checkValidFields {
            errorLabel.text = error
            return
        }
        clearError()
        STRouter.showLoader()
        Utils.delay(2) {
            STRouter.removeLoader()
            STRouter.showMap()
        }
    }
    
    func clearError() {
        fields.clearError()
        errorLabel.text = nil
    }
    
    override class var storyboardName: String {
        return "RNSLoginViewController"
    }
}
