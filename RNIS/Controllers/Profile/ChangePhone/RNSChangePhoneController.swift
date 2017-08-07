//
//  RNSChangePhoneController.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSChangePhoneController: RNSPhoneContrainerController {
    
    override var typeTitle: TypeTitle {
        return .change
    }
    
    override var placeHolderPhoneField: String? {
        return "Введите новый номер телефона"
    }
    
    override var titleBackButton: String? {
        return "Назад"
    }
    
    override func actionNext() {
    }
}
