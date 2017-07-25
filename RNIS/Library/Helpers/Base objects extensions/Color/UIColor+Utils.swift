//
//  UIColor+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

import UIKit

extension UIColor {
    
    static var color13:UIColor {
        return UIColor(13,145,209)
    }
    
    static var color34:UIColor {
        return UIColor(34,178,248)
    }
    
    convenience init(_ red255: UInt, _ green255: UInt, _ blue255: UInt) {
        self.init(red255,green255,blue255,1)
    }
    
    convenience init(_ red255: UInt,_ green255: UInt,_ blue255: UInt,_ alpha: CGFloat) {
        self.init(red: CGFloat(red255) / 255,
                  green: CGFloat(green255) / 255,
                  blue: CGFloat(blue255) / 255,
                  alpha: alpha)
    }
}
