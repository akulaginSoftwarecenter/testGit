//
//  RNSScrollShowContainer+Offset.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с передвижением
 */
extension RNSScrollShowContainer {
    
    var overTopOffset: CGFloat {
        return topOffset + navHeight
    }
    
    var topOffset: CGFloat {
        return view.bounds.height
    }
    
    var navHeight: CGFloat {
        return 64
    }
    
    var navOffset: CGFloat {
        return topOffset - navHeight
    }
    
    var halfOffset: CGFloat {
        return UIScreen.halfHeight
    }
    
    var almostOffset: CGFloat {
        return startBottomOffset/2
    }
    
    var bottomOffset: CGFloat {
        return 0
    }
}
