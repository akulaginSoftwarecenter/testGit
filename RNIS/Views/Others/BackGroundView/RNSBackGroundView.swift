//
//  RNSBackGroundView.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Фоновое представление общего назначения
 */
class RNSBackGroundView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .backColor
    }
}
