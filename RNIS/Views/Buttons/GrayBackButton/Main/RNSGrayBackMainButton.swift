//
//  RNSGrayBackMainButton.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс серой кнопки "назад"
 */
class RNSGrayBackMainButton: RNSGrayBackButton {

    @IBAction override func action(_ sender: Any) {
        STRouter.popMain()
    }
}
