//
//  RNSImageFactory.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSImageFactory: NSObject {
    
    typealias AliasDict = [NSAttributedStringKey: Any]
    
    static let shared = RNSImageFactory()
    
    let cache = NSCache<NSString,UIImage>()
    
    static var cache: NSCache<NSString,UIImage> {
        return shared.cache
    }
   
    static let bus_icon = #imageLiteral(resourceName: "BusIcon")
    static let bus_stop_current = #imageLiteral(resourceName: "Bus_stop_current")
    static let bus_stop = #imageLiteral(resourceName: "Bus_stop")
    static let bus_stopSmall = #imageLiteral(resourceName: "Bus_stopSmall")
     
    lazy var textAttr: AliasDict = {
        return self.textFontAttributes(false)
    }()
    
    lazy var textAttrSelected: AliasDict = {
        return self.textFontAttributes(true)
    }()
    
    func textFontAttributes(_ selected: Bool) -> AliasDict  {
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let color: UIColor = selected ? .white : .color424242
        return [
            NSAttributedStringKey.font: RNSImageFactory.font,
            NSAttributedStringKey.foregroundColor: color,
            NSAttributedStringKey.paragraphStyle: style,
        ]
    }
    
    static let font: UIFont = .cffazm12
    
    static func imageBusAt(_ text: String, selected: Bool) -> UIImage {
        let inImage = bus_icon
        
        let key = text as NSString
        if let icon = cache.object(forKey: key) {
            return icon
        }
        
        let scale = UIScreen.main.scale
        let widthText = text.width(font)
        let sizeImage = inImage.size
        let widthImage = sizeImage.width
        let heightImage = sizeImage.height
        let size = CGSize(width: widthImage + widthText + 5, height: heightImage)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        
        inImage.draw(in: CGRect(x: 0, y: 0, width: widthImage, height: heightImage))
                
        let rect = CGRect(x: widthImage + 2, y: 8, width: widthText, height: 12)
        let attr: AliasDict = selected ? shared.textAttrSelected : shared.textAttr
        text.draw(in: rect, withAttributes: attr)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext() ?? inImage
        UIGraphicsEndImageContext()
        
        cache.setObject(newImage, forKey: key)
        return newImage
    }
}
