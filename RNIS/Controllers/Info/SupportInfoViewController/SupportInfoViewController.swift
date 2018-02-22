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

/**
 Контроллер связи с разработчиками
 */
class SupportInfoViewController: UIViewController {

    @IBOutlet weak var nameSupportView: RNSSupportTextView!
    
    @IBOutlet var nameTopConstraint: NSLayoutConstraint!
    @IBOutlet var messageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var topTitle: RNSTopTitle!
    /// Поле для отображения и редактирования почты пользователя
    @IBOutlet weak var contactField: UITextField!
    /// Представление для ввода текста обращения
    //@IBOutlet weak var textView: UITextView!
    //@IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var messageView: RNSSupportTextView!
    /// Кнопка отправки
    @IBOutlet weak var blackButton: RNSBlackButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    /// Тип обращения
    var type: RNSPetitionType = .feedback
    var isShowNameSupport = false
    var titleName: String?
    var nameText: String?
    var handlerBody: ((String?) -> (String?))?
    
    /// Получение почты
    var contact: String? {
        return contactField.text
    }
    
    /// Получение обращения
    var body: String? {
        let text = messageView.text
        if let handler = handlerBody {
            return handler(text)
        }
        return text
    }
    
    var message: String?
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        showNameSupportView()
    }
    
    func showNameSupportView() {
        guard isShowNameSupport else {
            return
        }
        messageTopConstraint.priority = .defaultLow
        nameTopConstraint.priority = .defaultHigh
        nameSupportView.isHidden = false
        nameSupportView.topText = titleName
        nameSupportView.text = nameText
    }
    
    var isValidNameSupport: Bool {
        if !isShowNameSupport {
            return true
        }
        if let text = nameSupportView.text, text.isEmptyOrWhitespace {
            return false
        }
        return true
    }
}
