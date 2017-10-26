//
//  RNSFieldPlaceholderWhite.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Текстовое поле с заполнителем того же цвета что и текст
 */
class RNSFieldPlaceholderColor: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let placeholder = placeholder,
            let textColor = textColor else {
            return
        }
        
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                   attributes: [NSAttributedStringKey.foregroundColor: textColor])
    }
}
