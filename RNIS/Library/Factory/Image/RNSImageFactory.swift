//
//  RNSImageFactory.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSImageFactory: NSObject {
    static let shared = RNSImageFactory()
    
    let cache = NSCache<NSString,UIImage>()
    
    static var cache: NSCache<NSString,UIImage> {
        return shared.cache
    }
   
    static let bus_icon = #imageLiteral(resourceName: "BusIcon")
    static let bus_stop_current = #imageLiteral(resourceName: "Bus_stop_current")
    static let bus_stop = #imageLiteral(resourceName: "Bus_stop")
    static let bus_stopSmall = #imageLiteral(resourceName: "Bus_stopSmall")
     
    lazy var textFontAttributes: [NSAttributedStringKey: Any] = {
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        return [
            NSAttributedStringKey.font: UIFont.cffazm18,
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.paragraphStyle: style,
        ]
    }()
    
    static func imageBusAt(_ text: String) -> UIImage {
        let inImage = bus_icon
        
        let key = text as NSString
        if let icon = cache.object(forKey: key) {
            return icon
        }
        let scale = UIScreen.main.scale
        let size = inImage.size
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let width = size.width
        inImage.draw(in: CGRect(x: 0, y: 0, width: width, height: size.height))
        let rect = CGRect(x: 0, y: 15, width: width, height: 18)
        text.draw(in: rect, withAttributes: shared.textFontAttributes)
        let newImage = UIGraphicsGetImageFromCurrentImageContext() ?? inImage
        UIGraphicsEndImageContext()
        
        cache.setObject(newImage, forKey: key)
        return newImage
    }
}
