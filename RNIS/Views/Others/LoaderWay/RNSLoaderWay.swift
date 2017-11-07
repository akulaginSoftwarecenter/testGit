//
//  RNSLoaderWay.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSLoaderWay: RNSParentLoaderView {
    
    func prepareFailure() {
        labelText.text = "Не удалось загрузить данные"
    }
    
    override func animationShow() {
        defaultAlpha = 1
        super.animationShow()
    }
}
