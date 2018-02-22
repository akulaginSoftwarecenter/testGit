//
//  UIScreen+Utils.swift
//  Solity-iOS
//
//  Created by Artem Kulagin on 26.08.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation
import UIKit

/**
 Расширение для UIScreen
 */
extension UIScreen {
    
    static var width:CGFloat {
        return bounds().width
    }
    
    static var height:CGFloat {
        return bounds().height
    }
    
    static var halfHeight:CGFloat {
        return height/2
    }
    
    static func bounds() -> CGRect{
        return self.main.bounds
    }
    
    static var size: CGSize {
        return self.bounds().size
    }
}
