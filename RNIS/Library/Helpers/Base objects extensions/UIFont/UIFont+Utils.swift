//
//  UIFont+AppDefaultFonts.swift
//  Spytricks
//
//  Created by Ivan Alekseev on 13.09.16.
//  Copyright © 2016 Ivan Alekseev. All rights reserved.
//

import UIKit

extension UIFont {
    
    static var cffazm20:UIFont {
        return cffazm(20)
    }
    
    static var cffazm24:UIFont {
        return cffazm(24)
    }
    
    static func cffazm(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Cffazmiakhaddpiofffvylaqekz", size: size)!
    }
}