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
        loginField.text = "admin"
        passwordField.text = "password"
    }
    
    func loginPressed() {
        
        if let error = fields.checkValidFields {
            errorLabel.text = error
            return
        }
        clearError()
 /*
        guard let login = loginField.text,
        let password = passwordField.text else {
            return
        }
        
        STRouter.showLoader()
        RNSPostLogin(login, password: password, complete: {
            STRouter.removeLoader()
            STRouter.showMap()
        }, failure: {[weak self] (errorText) in
            STRouter.removeLoader()
            self?.prepareError(errorText)
        })
         */
        
        //Utils.delay(2) {
            STRouter.removeLoader()
            STRouter.showMap()
        //}
    }
    
    func  prepareError(_ error: String?) {
        errorLabel.text = error
    }
    
    func clearError() {
        fields.clearError()
        errorLabel.text = nil
    }
    
    override class var storyboardName: String {
        return "RNSLoginViewController"
    }
}
