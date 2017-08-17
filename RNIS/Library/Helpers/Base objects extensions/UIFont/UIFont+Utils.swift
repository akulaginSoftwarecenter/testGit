//
//  UIFont+AppDefaultFonts.swift
//  Spytricks
//
//  Created by Ivan Alekseev on 13.09.16.
//  Copyright © 2016 Ivan Alekseev. All rights reserved.
//

import UIKit

extension UIFont {
    
    static var cffazm8:UIFont {
        return cffazm(8)
    }
    
    static var cffazm12:UIFont {
        return cffazm(12)
    }
    
    static var cffazm16:UIFont {
        return cffazm(16)
    }
    
    static var cffazm18:UIFont {
        return cffazm(18)
    }
    
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
