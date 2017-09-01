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
   
    let inImage = #imageLiteral(resourceName: "BusIcon")
    
    lazy var textFontAttributes: AliasDictionary = {
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        return [
            NSFontAttributeName: UIFont.cffazm18,
            NSForegroundColorAttributeName: UIColor.white,
            NSParagraphStyleAttributeName: style,
        ]
    }()
    
    static func imageBus(_ item: RNSBus?) -> UIImage {
        let inImage = shared.inImage
        guard let item = item else {
            return inImage
        }
        
        let text = item.title
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
