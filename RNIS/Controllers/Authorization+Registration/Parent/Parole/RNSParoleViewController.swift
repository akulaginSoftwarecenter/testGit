//
//  RNSParoleViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 RNSParoleViewController
 */

class RNSParoleViewController: RNSCoverViewController,ContainerProtocol {
    
    @IBOutlet weak var passwordOneField: STPasswordField!
    @IBOutlet weak var passwordTwoField: STPasswordField!
    var placeholderPassworOne: String?
    var titleBlackButton: String?
    
    lazy var fields:[RNSTextField] = {
        return [self.passwordOneField, self.passwordTwoField]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        addDoneButtonOnKeyboard()
    }
   
    override func loginPressed() {
        if let error = fields.checkValidFields {
            errorLabel.text = error
            return
        }
        
        if passwordOneField.text !=  passwordTwoField.text {
            errorLabel.text = "Пароли не совпадают"
            passwordOneField.setStateNotValid()
            passwordTwoField.setStateNotValid()
            return
        }
        
        clearError()
        handlerBlackAction?()
    }
    
    func clearError() {
        fields.clearError()
        errorLabel.text = nil
    }

    override class var storyboardName: String {
        return kParoleVC
    }
}
