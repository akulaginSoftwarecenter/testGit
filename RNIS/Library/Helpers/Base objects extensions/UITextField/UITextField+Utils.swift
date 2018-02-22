//
//  UITextField+Utils.swift
//  Spytricks
//
//  Created by Артем Кулагин on 06.04.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit

private var xoAssociationKey: UInt8 = 0

/**
 Расширение для UITextField
 */
extension UITextField {
    
    var handlerEditingChanged: EmptyBlock? {
        get {
            return objc_getAssociatedObject(self, &xoAssociationKey) as? EmptyBlock
        }
        set(newValue) {
            objc_setAssociatedObject(self, &xoAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func editingChanged(handler: @escaping EmptyBlock) {
        self.handlerEditingChanged = handler
        addTarget(self, action: #selector(actionEditingChanged), for: .editingChanged)
    }
    
    @objc func actionEditingChanged() {
        handlerEditingChanged?()
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        get {
            return nil
        }
        set {
            self.preparePlaceholderColor(newValue)
        }
    }
    
    func preparePlaceholderColor(_ placeholderColor: UIColor?) {
        guard   let placeholderColor = placeholderColor,
               let placeholder = placeholder,
            let font = font else {
            return
        }

        let attributes = [NSAttributedStringKey.foregroundColor: placeholderColor,
                          NSAttributedStringKey.font: font]
        
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                   attributes:attributes)
    }

    func addDoneButton(_ title: String?) {
        addButtonOnKeyboard(title, target: self, action: #selector(UIResponder.resignFirstResponder))
    }

    func addButtonOnKeyboard(_ title: String?, target: Any?, action: Selector?)  {
        let rect = CGRect(x: 0, y: 0, width: UIScreen.width, height: 50)
        let doneToolbar: UIToolbar = UIToolbar(frame: rect)
        doneToolbar.barStyle = .blackTranslucent
        doneToolbar.barTintColor = .white
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: title, style: .done, target: target, action: action)
        
        let items = [flexSpace,done]
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        inputAccessoryView = doneToolbar
    }
    
    var textWidth: CGFloat {
        guard let font = font else {
            return 0
        }
        return text?.width(font) ?? 0
    }
}
