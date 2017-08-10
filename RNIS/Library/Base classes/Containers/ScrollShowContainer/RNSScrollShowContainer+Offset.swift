//
//  RNSScrollShowContainer+Offset.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSScrollShowContainer {
    
    var overTopOffset: CGFloat {
        return topOffset + navHeight
    }
    
    var topOffset: CGFloat {
        return UIScreen.height
    }
    
    var navHeight: CGFloat {
        return 64
    }
    
    var navOffset: CGFloat {
        return topOffset - navHeight
    }
    
    var halfOffset: CGFloat {
        return UIScreen.height/2
    }
    
    var startOffset: CGFloat {
        return UIScreen.height/3
    }
    
    var almostOffset: CGFloat {
        return startOffset/2
    }
    
    var bottomOffset: CGFloat {
        return 0
    }
}
