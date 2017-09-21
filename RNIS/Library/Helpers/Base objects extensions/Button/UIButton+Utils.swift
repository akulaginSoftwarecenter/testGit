//
//  UIButton+Utils.swift
//  Spytricks
//
//  Created by Артем Кулагин on 30.03.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit

private var xoAssociationKey: UInt8 = 0

extension UIButton {
    
    var handlerActionTouchUpInside: EmptyBlock? {
        get {
            return objc_getAssociatedObject(self, &xoAssociationKey) as? EmptyBlock
        }
        set(newValue) {
            objc_setAssociatedObject(self, &xoAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func touchUpInside(handler: EmptyBlock?) {
        self.handlerActionTouchUpInside = handler
        addTarget(self, action: #selector(actionTouchUpInside), for: .touchUpInside)
    }
    
    @objc func actionTouchUpInside() {
        handlerActionTouchUpInside?()
    }
}
