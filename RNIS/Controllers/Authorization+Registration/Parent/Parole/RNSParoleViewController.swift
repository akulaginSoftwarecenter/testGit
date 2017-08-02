//
//  RNSParoleViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSParoleViewController: UIViewController {
    
    var handlerBlackAction: EmptyBlock?
    
    @IBOutlet var coverView: RNSLoginView!
    @IBOutlet weak var passwordOneField: STPasswordField!
    @IBOutlet weak var passwordTwoField: STPasswordField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var titleTextTop: String?
    var placeholderPassworOne: String?
    var titleBlackButton: String?
    
    lazy var fields:[RNSTextField] = {
        return [self.passwordOneField, self.passwordTwoField]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
    }
   
    func loginPressed() {
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
