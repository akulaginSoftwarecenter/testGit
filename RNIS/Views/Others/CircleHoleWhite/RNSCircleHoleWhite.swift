//
//  RNSCircleHoleWhite.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSCircleHoleWhite: RNSCircleHole {

    override func awakeFromNib() {
        super.awakeFromNib()
        mainCircle.backgroundColor = .FFB9AF
        smallCircle.backgroundColor = .white
    }
    
    func prepareDone() {
        mainCircle.prepareDone()
    }
}
