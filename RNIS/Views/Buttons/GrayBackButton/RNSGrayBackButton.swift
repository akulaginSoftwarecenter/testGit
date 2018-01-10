//
//  RNSGrayBackButton.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Серая кнопка общего назначения
 */
class RNSGrayBackButton: BaseViewWithXIBInit {
    
    /// Кнопка
    @IBOutlet var button: UIButton!
        
    /// Заголовок
    @IBInspectable var title: String? {
        didSet {
            prepareTitle()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareTitle()
    }
    
    /// Настройка заголовка
    func prepareTitle() {
        guard let title = title else {
            return
        }
        button.setTitle(title, for: UIControlState())
    }
    
    /// Событие нажатия
    @IBAction func action(_ sender: Any) {
        STRouter.pop()
    }
    
    override var nibNamed:String {
        return "RNSGrayBackButton"
    }
}
