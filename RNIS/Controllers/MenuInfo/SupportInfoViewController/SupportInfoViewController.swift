//
//  SupportInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

enum RNSPetitionType: String {
    case feedback = "Связь с разработчиками"
    case complaint = "Пожаловаться"
}

class SupportInfoViewController: UIViewController {

    @IBOutlet weak var topTitle: RNSTopTitle!
    @IBOutlet weak var contactField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var blackButton: RNSBlackButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    var type: RNSPetitionType = .feedback
    
    var contact: String? {
        return contactField.text
    }
    
    var body: String? {
        return textView.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topTitle.text = type.rawValue
        
        blackButton.handlerAction = { [weak self] in
            self?.checkValidFields()
        }
    }
    
    func send() {
        if type == .feedback {
            RNSPostFeedback(contact, body: body) { [weak self] item in
                self?.showAlert()
            }
        } else {
            RNSPostComplaint(contact, body: body) { [weak self]  _ in
                self?.showAlert()
            }
        }
    }
        
    func showAlert() {
        STRouter.showAlertOk("Ваше сообщение отправлено!") { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    func checkValidFields() {
        prepareError(nil)
        guard let contact = contact, !contact.isEmpty else {
            prepareError("Заполните Почту")
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
