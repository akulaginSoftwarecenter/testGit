//
//  RNSArrowLeft.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSArrowLeft: UIImageView {
    convenience init() {
        self.init(image: #imageLiteral(resourceName: "ArrowLeft"))
        contentMode = .right
        clipsToBounds = true
    }
}
