//
//  RNSCircleRed.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Circle Red
 */


class RNSCircle: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        prepareCircle()
    }
    
    func prepareDone() {
        backgroundColor = .A3423C
    }
    
    func prepareUnDone() {
        backgroundColor = .white
    }
}
