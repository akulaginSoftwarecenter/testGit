//
//  RNSCodeViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 RNSCodeViewController
 */

class RNSCodeViewController: RNSCoverViewController,ContainerProtocol {
    
    @IBOutlet weak var codeField: RNSTextField!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var repeatButton: UIButton!
    
    var handlerRepeatCode: EmptyBlock?
    var phone: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        preparePhone()
        codeField.addButtonOnKeyboard("Далее   ", target: self, action: #selector(loginPressed))
    }
    
    func preparePhone() {
        guard let phone = phone else {
            return
        }
        phoneLabel.text = InputFieldsValidator.format(phone).text
    }
    
    override func loginPressed() {
        if !codeField.isValid {
            codeField.setStateNotValid()
            errorLabel.text = "Введите код"
            return
        }
        clearError()
        handlerBlackAction?()
    }
    
    func clearError() {
        codeField.setStateValid()
        errorLabel.text = nil
    }

    @IBAction func repeatCodeAction(_ sender: Any) {
        handlerRepeatCode?()
    }
    
    override class var storyboardName: String {
        return kCodeVC
    }
}
