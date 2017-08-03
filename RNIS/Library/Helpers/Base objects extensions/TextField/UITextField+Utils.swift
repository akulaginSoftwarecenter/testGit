//
//  UITextField+Utils.swift
//  Spytricks
//
//  Created by Артем Кулагин on 06.04.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit

private var xoAssociationKey: UInt8 = 0

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
    
    func actionEditingChanged() {
        handlerEditingChanged?()
    }
}