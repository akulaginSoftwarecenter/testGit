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

class RNSTextField: UITextField {
    
    var errorText:String? {
        return nil
    }
    
    var isValid:Bool {
        return !(text?.isEmpty ?? true)
    }
    
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
    
    @IBInspectable var topText: String? {
        didSet {
            topLabel.text = topText
        }
    }
    @IBInspectable var placeholderFontSize: CGFloat = 24 {
        didSet {
            self.preparePlaceholder()
        }
    }
    
    var placeholderFont: UIFont {
        return .cffazm(placeholderFontSize)
    }
    
    var placeholderColor: UIColor {
        return .whiteAlpha50
    }
    
    var stateVar: STTextFieldState = .normal
    
    var bottomConstraint: Constraint?
    
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
    
    func prepareUI() {
        prepareUI( placeholderKey, state: stateVar)
    }
    
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
    
    func preparePlaceholder() {
        guard let placeholderKey = placeholderKey else {
            return
        }
        let attributes = [NSForegroundColorAttributeName: placeholderColor,
                          NSFontAttributeName: placeholderFont]
        
        attributedPlaceholder = NSAttributedString(string:NSLoc(placeholderKey),
                                                   attributes:attributes)
        
    }
    
    func setStateValid() {
        setState(true)
    }
    
    func setStateNotValid() {
        setState(false)
    }
    
    func setState(_ valid: Bool) {
        setState(valid ? .normal : .black)
    }
    
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
