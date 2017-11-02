//
//  STTextField.swift
//  Spytricks
//
//  Created by Ivan Alekseev on 10.09.16.
//  Copyright © 2016 Ivan Alekseev. All rights reserved.
//

import UIKit
import SnapKit


enum STTextFieldState {
    case normal, black
}

/**
 Собственное текстовое поле общего назначения
 */
class RNSTextField: UITextField {
    
    /// Текст ошибки
    var errorText:String? {
        return nil
    }
    
    /// Состояние валидности
    var isValid:Bool {
        return !(text?.isEmpty ?? true)
    }
    
    /// Ключ заполнителя
    @IBInspectable var placeholderKey: String? {
        didSet {
            self.preparePlaceholder()
        }
    }
    
    @IBInspectable var bottomLineOffset: CGFloat = 0 {
        didSet {
            bottomConstraint?.update(offset: bottomLineOffset)
        }
    }
    
    @IBInspectable var leftTextAlignment: Bool = false {
        didSet {
            if leftTextAlignment  {
                textAlignment = .left
            }
        }
    }
    
    /// Текст заголовка
    @IBInspectable var topText: String? {
        didSet {
            topLabel.text = topText
        }
    }
    
    /// размер шрифта заполнителя
    @IBInspectable var placeholderFontSize: CGFloat = 24 {
        didSet {
            self.preparePlaceholder()
        }
    }
    
    /// Шрифт заполнителя
    var placeholderFont: UIFont {
        return .cffazm(placeholderFontSize)
    }
    
    /// Цвет заполнителя
    var placeholderColorText: UIColor {
        return .whiteAlpha50
    }
    
    /// Состояние поля
    var stateVar: STTextFieldState = .normal
    
    var bottomConstraint: Constraint?
    
    /// Надпись заголовка
    lazy var topLabel: UILabel = {
        let view = UILabel()
        view.font = .cffazm16
        view.textColor = .whiteAlpha50
        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.left.right.equalTo(self)
            make.bottom.equalTo(self.snp.top).offset(4)
        }
        return view
    }()
    
    lazy var bottomLine: UIView = {
        let view = UIView()
        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.left.right.equalTo(self)
            make.height.equalTo(1)
            self.bottomConstraint = make.bottom.equalTo(self).constraint
        }
        return view
    }()
    
    required init() {
        super.init(frame: CGRect.zero)
        prepareUI()
        
    }
    
    /// Создание поля
    ///
    /// - Parameters:
    ///   - aPlaceholderKey: ключ заполнителя
    ///   - state: состояние поля
    convenience init(placeholderKey aPlaceholderKey: String, state: STTextFieldState = .normal) {
        self.init()
        self.placeholderKey = aPlaceholderKey
        self.stateVar = state
        prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareUI()
    }
    
    /// Обновление представлений
    func prepareUI() {
        prepareUI( placeholderKey, state: stateVar)
    }
    
    /// Обновление представлений
    ///
    /// - Parameters:
    ///   - aPlaceholderKey: ключ заполнителя
    ///   - state: состояние поля
    func prepareUI(_ aPlaceholderKey: String?, state: STTextFieldState = .normal) {

        preparePlaceholder()
        
        textColor = .white
        setState(state)
        backgroundColor = .clear
        font = .cffazm24
        
        snp.makeConstraints { (make) in
            _ = make.height.equalTo(45)
        }
        borderStyle = .none
        textAlignment = .center
    }
    
    /// Настройка зполнителя
    func preparePlaceholder() {
        guard let placeholderKey = placeholderKey else {
            return
        }
        var attributes = [
            NSAttributedStringKey.foregroundColor: placeholderColorText,
            NSAttributedStringKey.font: placeholderFont
        ]
        let text = NSLoc(placeholderKey)
        if text.count > 24 {
            attributes[.font] = placeholderFont.withSize(22)
        }
        attributedPlaceholder = NSAttributedString(string: text,
                                                   attributes:attributes)
        
    }
    
    /// Сделать поле валидным
    func setStateValid() {
        setState(true)
    }
    
    /// Сделать поле не валидным
    func setStateNotValid() {
        setState(false)
    }
    
    /// Настроить валидность поля
    ///
    /// - Parameter valid: состояние валидности
    func setState(_ valid: Bool) {
        setState(valid ? .normal : .black)
    }
    
    /// Настроить состояние поля
    ///
    /// - Parameter state: состояние поля
    func setState(_ state: STTextFieldState) {
        var color: UIColor
        switch state {
        case .normal:
            color = .E25E55
        case .black:
            color = .black
        }
        bottomLine.backgroundColor = color
    }
}
