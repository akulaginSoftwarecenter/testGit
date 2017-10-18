//
//  RNSDotsWhiteVertical.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Dots White Vertical
 */

class RNSDotsWhiteVertical: RNSDotsWhiteHorizontal {
    
    
    override var sizeCircle: CGFloat {
        return 3
    }
    
    override var axis : UILayoutConstraintAxis {
        return .vertical
    }
 
}
