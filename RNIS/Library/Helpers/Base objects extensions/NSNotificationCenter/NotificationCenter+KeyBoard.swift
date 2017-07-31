//
//  NSNotificationCenter+KeyBoard.swift
//  Spytricks
//
//  Created by Артем Кулагин on 16.03.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation

typealias NotificationBlock = (Notification) -> Void

extension NotificationCenter {
    
    static func keyboardWillShow(usingBlock block: @escaping NotificationBlock) -> NSObjectProtocol {
       return addObserverForName(NSNotification.Name.UIKeyboardWillShow.rawValue, usingBlock: block)
    }
    
    static func keyboardWillHide(usingBlock block: @escaping NotificationBlock) -> NSObjectProtocol {
       return addObserverForName(NSNotification.Name.UIKeyboardWillHide.rawValue, usingBlock: block)
    }
    
    static func addObserverForName(_ name: String, usingBlock block: @escaping NotificationBlock) -> NSObjectProtocol {
        return self.default.addObserver(forName: NSNotification.Name(rawValue: name), object: nil, queue: nil, using: block)
    }
}


