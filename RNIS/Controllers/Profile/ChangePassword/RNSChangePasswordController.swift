//
//  RNSChangePasswordController.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSChangePasswordController: UIViewController {

    @IBOutlet var coverView: RNSLoginView!
    @IBOutlet weak var passwordOldField: STPasswordField!
    @IBOutlet weak var passwordOneField: STPasswordField!
    @IBOutlet weak var passwordTwoField: STPasswordField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet var fields: [STPasswordField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCoverView()

    }
    
    func prepareCoverView() {
        coverView.handlerBlackAction = { [weak self] in
            self?.savePressed()
        }
    }
    
    func savePressed() {
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
        pop()
    }
    
    func pop() {
        STRouter.pop { 
            STRouter.showAlertOk("Ваш пароль успешно изменён")
        }
    }
    
    func clearError() {
        fields.clearError()
        errorLabel.text = nil
    }
    
    override class var storyboardName: String {
        return "RNSChangePasswordController"
    }
}
