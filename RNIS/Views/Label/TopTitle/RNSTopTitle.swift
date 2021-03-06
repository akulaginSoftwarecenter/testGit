//
//  RNSTopTitle.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Собственная надпись, предназначена для отображения заголовков
 */
class RNSTopTitle: UILabel {

    /// метод обработки загрузки вью
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textColor = .white
        font = .cffazm24
        prepareConstraint()
        textAlignment = .center
    }
    
    func prepareConstraint() {
        guard let view = superview else {
            return
        }
        snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(38)
            make.right.left.equalTo(view)
        }
    }
}
