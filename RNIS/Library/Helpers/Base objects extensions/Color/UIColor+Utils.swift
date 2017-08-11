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
    
    static var color13: UIColor {
        return UIColor(13,145,209)
    }
    
    static var color34: UIColor {
        return UIColor(34,178,248)
    }
    
    static var color241: UIColor {
        return UIColor(241,100,90)
    }
    
    static var whiteAlpha50: UIColor {
        return white.withAlphaComponent(0.5)
    }

    static var E25E55:UIColor {
        return UIColor(hexString: "E25E55")
    }
    
    static var F1645A:UIColor {
        return UIColor(hexString: "F1645A")
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
    
    
    convenience init(hexString:String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
