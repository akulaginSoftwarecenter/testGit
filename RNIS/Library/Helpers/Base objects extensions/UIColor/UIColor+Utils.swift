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
    
    static var backColor: UIColor {
        return .F1645A
    }
    
    static var color13: UIColor {
        return #colorLiteral(red: 0.05098039216, green: 0.568627451, blue: 0.8196078431, alpha: 1)
    }
    
    static var color34: UIColor {
        return #colorLiteral(red: 0.1333333333, green: 0.6980392157, blue: 0.9725490196, alpha: 1)
    }
    
    static var color125: UIColor {
        return #colorLiteral(red: 0.4901960784, green: 0.4901960784, blue: 0.4901960784, alpha: 0.7)
    }
    
    static var color163: UIColor {
        return #colorLiteral(red: 0.6392156863, green: 0.6352941176, blue: 0.5843137255, alpha: 1)
    }
    
    static var color169: UIColor {
        return #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1)
    }
    
    static var color234: UIColor {
        return #colorLiteral(red: 0.9176470588, green: 0.2823529412, blue: 0.2705882353, alpha: 1)
    }
    
    static var color241: UIColor {
        return #colorLiteral(red: 0.9450980392, green: 0.3921568627, blue: 0.3529411765, alpha: 1)
    }
    
    static var whiteAlpha50: UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
    }
    
    static var whiteAlpha70: UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7)
    }
    
    static var color01B3FD:UIColor {
        return #colorLiteral(red: 0.003921568627, green: 0.7019607843, blue: 0.9921568627, alpha: 1)
    }
    
    static var A3423C:UIColor {
        return #colorLiteral(red: 0.6392156863, green: 0.2588235294, blue: 0.2352941176, alpha: 1)
    }
    
    static var AFAFAF:UIColor {
        return #colorLiteral(red: 0.6862745098, green: 0.6862745098, blue: 0.6862745098, alpha: 1)
    }
    
    static var E25E55:UIColor {
        return #colorLiteral(red: 0.8862745098, green: 0.368627451, blue: 0.3333333333, alpha: 1)
    }
    
    static var EA4845:UIColor {
        return #colorLiteral(red: 0.9176470588, green: 0.2823529412, blue: 0.2705882353, alpha: 1)
    }
    
    static var D95A53:UIColor {
        return #colorLiteral(red: 0.8509803922, green: 0.3529411765, blue: 0.3254901961, alpha: 1)
    }
    
    static var F1645A:UIColor {
        return #colorLiteral(red: 0.9450980392, green: 0.3921568627, blue: 0.3529411765, alpha: 1)
    }
    
    static var FFB9AF:UIColor {
        return #colorLiteral(red: 1, green: 0.7254901961, blue: 0.6862745098, alpha: 1)
    }
    
    static var color424242: UIColor {
        return #colorLiteral(red: 0.2588235294, green: 0.2588235294, blue: 0.2588235294, alpha: 1)
    }
    
    static var color229A55: UIColor {
        return #colorLiteral(red: 0.1333333333, green: 0.6039215686, blue: 0.3333333333, alpha: 1)
    }
    
    static var color27AE60: UIColor {
        return #colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)
    }
    
    static var blackAlpha50: UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
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
        switch hex.count {
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
    
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
