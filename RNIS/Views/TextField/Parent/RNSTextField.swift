//
//  STTextField.swift
//  Spytricks
//
//  Created by Ivan Alekseev on 10.09.16.
//  Copyright © 2016 Ivan Alekseev. All rights reserved.
//

import UIKit

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
            self.preparePlaceholder(placeholderKey)
        }
    }
    
    var placeholderFont: UIFont {
        return .cffazm24
    }
    
    var placeholderColor: UIColor {
        return .whiteAlpha50
    }
    
    var stateVar: STTextFieldState = .normal
    
    lazy var bottomLine: UIView = {
        let view = UIView()
        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.left.right.equalTo(self)
            make.height.equalTo(1)
            make.bottom.equalTo(self)
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

        preparePlaceholder(aPlaceholderKey)
        
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
    
    func preparePlaceholder(_ placeholderKey: String?) {
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
            color = .hexE25E55
        case .black:
            color = .black
        }
        bottomLine.backgroundColor = color
    }
}
