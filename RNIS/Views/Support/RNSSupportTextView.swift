//
//  RNSSupportTextView.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
/**
 Класс поле ввода текста в контроллера отправки письма в поддержку
 */
class RNSSupportTextView: BaseViewWithXIBInit {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    
    @IBInspectable var topText: String? {
        didSet {
            titleLabel.text = topText
        }
    }
    
    var text: String? {
        set {
            textView.text = newValue
            updateHeightTextView()
        }
        get {
            return textView.text
        }
    }
}
