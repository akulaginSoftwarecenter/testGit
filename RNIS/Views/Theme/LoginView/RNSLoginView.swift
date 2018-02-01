//
//  RNSLoginView.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Фоновое представление для регистрации и входа
 */
class RNSLoginView: BaseViewWithXIBInit {

    @IBOutlet weak var blackButton: RNSBlackButton!
    @IBOutlet weak var titleTop: UILabel!
    
    var handlerBlackAction: EmptyBlock?
    var handlerLogoAction: EmptyBlock?
    
    @IBInspectable var titleBlackButton: String {
        get { return "" }
        set {
            blackButton.title = newValue
        }
    }
    
    @IBInspectable var titleTextTop: String {
        get { return "" }
        set {
            self.titleTop.text = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        blackButton.button.touchUpInside { [weak self] in
            self?.handlerBlackAction?()
        }
    }
    
    @IBAction func logoAction(_ sender: Any) {
        handlerLogoAction?()
    }
}
