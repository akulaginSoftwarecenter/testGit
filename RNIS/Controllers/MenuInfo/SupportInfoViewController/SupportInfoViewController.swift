//
//  SupportInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class SupportInfoViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var contactField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var blackButton: RNSBlackButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    var name: String? {
        return nameField.text
    }
    
    var contact: String? {
        return contactField.text
    }
    
    var body: String? {
        return textView.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blackButton.handlerAction = { [weak self] in
            self?.checkValidFields()
        }
    }
    
    func send() {
       RNSPostFeedback(name, contact: contact, body: body) { [weak self] item in
          self?.showAlert()
       }
    }
        
    func showAlert() {
        STRouter.showAlertOk("Ваше сообщение отправлено!") { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    func checkValidFields() {
        prepareError(nil)
        guard let name = name, !name.isEmpty else {
            prepareError("Заполните имя")
            return
        }
        guard let contact = contact, !contact.isEmpty else {
            prepareError("Заполните Почта / Телефон")
            return
        }
        guard let body = body, !body.isEmpty else {
            prepareError("Заполните сообщение")
            return
        }
        send()
    }
    
    func prepareError(_ error: String?) {
        errorLabel.text = error
    }
    
    override class var storyboardName: String {
        return "SupportInfoViewController"
    }
}
