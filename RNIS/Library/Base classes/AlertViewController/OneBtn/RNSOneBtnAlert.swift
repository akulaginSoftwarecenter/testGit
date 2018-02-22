//
//  RNSOneBtn.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс кнопки алерта
 */
class RNSOneBtnAlert: UIButton {
  
    /// Метод инициализации 
    convenience init(_ title: String? = "ОК") {
        self.init(frame: CGRect.zero)
        
        titleLabel?.font = .cffazm22
        setTitle(title, for: UIControlState())
        backgroundColor = .EA4845
        
        snp.makeConstraints { (make) in
            make.height.equalTo(59)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        roundBottomCorners()
    }
}
