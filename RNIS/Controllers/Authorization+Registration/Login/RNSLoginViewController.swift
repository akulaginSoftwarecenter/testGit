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
    
    var item: RNSUserPayload?
    
    lazy var fields:[RNSTextField] = {
        return [self.loginField, self.passwordField]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.handlerBlackAction = { [weak self] in
            self?.loginPressed()
        }
        
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
        
        STRouter.showLoader()
        RNSPostLogin(login, password: password, complete: { [weak self] in
            STRouter.removeLoader()
            STRouter.popToRoot()
            RNSMenuManager.leftMenuUpdate()
        }, failure: {[weak self] (errorText) in
            STRouter.removeLoader()
            self?.prepareError(errorText)
        })
    }
    
    override class var storyboardName: String {
        return "RNSLoginViewController"
    }
}
