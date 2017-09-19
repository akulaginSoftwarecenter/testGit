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
    
    var item: RNSUserPayload?
    
    func loadData() {
        STRouter.showLoader()
        RNSPostUserGet {[weak self] (reply, error, _) in
            self?.item = reply as? RNSUserPayload
            STRouter.removeLoader()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        prepareCoverView()
    }
    
    func prepareCoverView() {
        coverView.handlerBlackAction = { [weak self] in
            self?.savePressed()
        }
    }
    
    var passwordOld: String? {
        return passwordOldField.text
    }
    
    func savePressed() {
        if let error = fields.checkValidFields {
            prepareError(error)
            return
        }
        
        if passwordOld != UserDefaults.password {
            prepareError("Не правильный старый пароль")
            return
        }
        
        if passwordOneField.text !=  passwordTwoField.text {
            prepareError("Пароли не совпадают")
            passwordOneField.setStateNotValid()
            passwordTwoField.setStateNotValid()
            return
        }
        
        clearError()
        actionNext()
    }
    
    func actionNext() {
        let newPassword = passwordTwoField.text
        item?.password = newPassword
        RNSPostUpdate(item, complete: { [weak self] item in
            UserDefaults.setPassword(newPassword)
            self?.pop()
        }, failure: { [weak self] error in
            self?.prepareError(error)
        })
    }
    
    func prepareError(_ error: String?) {
        errorLabel.text = error
    }
    
    func pop() {
        STRouter.pop { 
            STRouter.showAlertOk("Ваш пароль успешно изменён")
        }
    }
    
    func clearError() {
        fields.clearError()
        prepareError(nil)
    }
    
    override class var storyboardName: String {
        return "RNSChangePasswordController"
    }
}
