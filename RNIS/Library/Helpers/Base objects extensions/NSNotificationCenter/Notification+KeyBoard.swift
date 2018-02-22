//
//  Notification+KeyBoard.swift
//  Spytricks
//
//  Created by Артем Кулагин on 16.03.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation
import UIKit

/**
 Расширение для Notification для клавиатуры
 */
extension Notification {
    
    var height: CGFloat? {
        let rect = (userInfo?[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
        return rect?.height
    }
    
    var duration: Double? {
        return (userInfo?[UIKeyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue
    }
}
