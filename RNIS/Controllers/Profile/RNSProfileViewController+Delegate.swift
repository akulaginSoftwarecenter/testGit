//
//  RNSProfileViewController+Delegate.swift
//  RNIS
//
//  Created by Артем Кулагин on 19.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSProfileViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if  textField == nameField {
            changeName()
        } else if  textField == emailField {
            changeEmail()
        }
    }
    
    func changeName() {
        let text = nameField.text
        if text == item?.name {
            return
        }
        item?.name = text
        updateItem()
    }
    
    func changeEmail() {
        prepareError(nil)
        if let error = [emailField].checkValidFields {
            prepareError(error)
            return
        }
        
        let text = emailField.text
        if text == item?.email {
            return
        }
  
        item?.email = text
        updateItem({ [weak self] in
            self?.showAlertOk("Для завершения изменения адреса почты перейдите по ссылке в письме")
        })
    }
    
    func updateItem(_ complete: EmptyBlock? = nil) {
        STRouter.showLoader()
        RNSPostUpdate(item, complete: { item in
           STRouter.removeLoader()
           RNSMenuManager.leftMenuUpdate()
           complete?()
        }, failure: {[weak self]  error in
            STRouter.removeLoader()
            self?.showAlertOk(error)
        })
    }
    
    func showAlertOk(_ message: String?) {
        STRouter.showAlertOk(message)
    }
    
    func prepareError(_ error: String?) {
        errorLabel.text = error
    }
}
