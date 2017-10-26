//
//  RNSBlackButton.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Черная кнопка общего назначения
 */
class RNSBlackButton: BaseViewWithXIBInit {
    
    /// кнопка
    @IBOutlet var button: UIButton!
    /// Обработчик нажатия
    var handlerAction: EmptyBlock?
    
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
        button.setTitle(title, for: UIControlState())
    }
    
    /// Событие нажатия
    @IBAction func action(_ sender: Any) {
        handlerAction?()
    }
    
    override var nibNamed:String {
        return String(describing: RNSBlackButton.self)
    }
}
