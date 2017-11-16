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
    
    /// Получение почты
    var contact: String? {
        return contactField.text
    }
    
    /// Получение обращения
    var body: String? {
        return messageView.text
    }
    
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        loadData()
        showNameSupportView()
    }
    
    func showNameSupportView() {
        messageTopConstraint.priority = .defaultLow
        nameTopConstraint.priority = .defaultHigh
        nameSupportView.isHidden = false
        nameSupportView.topText = "Остановка"
    }

    override class var storyboardName: String {
        return "SupportInfoViewController"
    }
}
