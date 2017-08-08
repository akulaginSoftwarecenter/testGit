//
//  UIScreen+Utils.swift
//  Solity-iOS
//
//  Created by Artem Kulagin on 26.08.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation
import UIKit

extension UIScreen
{
    static var width:CGFloat {
        return bounds().width
    }
    
    static var height:CGFloat {
        return bounds().height
    }
    
    static func bounds() -> CGRect{
        return self.main.bounds
    }
}
