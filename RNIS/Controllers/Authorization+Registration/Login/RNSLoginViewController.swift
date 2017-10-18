//
//  RNSLoginViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 RNSLoginViewController
 */

class RNSLoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: RNSBlackButton!
    @IBOutlet weak var backButton: RNSBlackButton!
    @IBOutlet var loginView: RNSLoginView!
    @IBOutlet weak var loginField: RNSPhoneField!
    @IBOutlet weak var passwordField: STPasswordField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var item: RNSUserPayload?
    
    lazy var fields:[RNSTextField] = {
        return [self.loginField, self.passwordField]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
             
        loginView.blackButton.isHidden = true
        prepareButtons()
        prepareLoginIfNeed()
        addDoneButtonOnKeyboard()
    }
    
    func loginPressed() {
        
        if let error = fields.checkValidFields {
            errorLabel.text = error
            return
        }
        clearError()
        
        guard let password = passwordField.text else {
            return
        }
        let login = "+7" + loginField.last10
        
        UserDefaults.setLogin(login)
        UserDefaults.setPassword(password)
        
        RNISAuthManager.login(login, password: password) {[weak self] (errorText) in
            self?.prepareError(errorText)
        }
    }
    
    override class var storyboardName: String {
        return "RNSLoginViewController"
    }
}
