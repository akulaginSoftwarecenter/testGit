//
//  ReportInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/**
 Контроллер отправки сообщений об ошибках
 */

class ReportInfoViewController: UIViewController {

    /// Представление для ввода текста сообщения
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    /// Надпись с текстом ошибки
    @IBOutlet weak var errorLabel: UILabel!

    /// Событие нажатия кнопки "отправить"
    @IBAction func actionButton(_ sender: Any) {
        /*
        prepareError(nil)
        guard let body = textView.text, !body.isEmpty else {
            prepareError("Заполните текст обращения")
            return
        }
        
        RNSPostComplaint(body) { [weak self]  _ in
            self?.showAlert()
        }
         */
    }
    
    /// Показать сообщение об успешной отправке
    func showAlert() {
        STRouter.showAlertOk("Ваше сообщение отправлено!") { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    func prepareError(_ error: String?) {
        errorLabel.text = error
    }
    
    override class var storyboardName: String {
        return "ReportInfoViewController"
    }
}
