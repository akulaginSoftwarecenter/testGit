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
        let fullWidth = widthImage + widthText + 5
        let size = CGSize(width: fullWidth, height: heightImage)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        /*
        let halfImage = widthImage/2
        let widthView = fullWidth - halfImage
        let view = UIView()
        view.backgroundColor = .red
        view.draw(CGRect(x: halfImage, y: 2, width: widthView, height: 20))
         */
        if let context = UIGraphicsGetCurrentContext() {
            let halfImage = widthImage/2
            //let widthView = fullWidth - halfImage
            let originY:CGFloat = 2
            //let corner:CGFloat = 5
            let heightView: CGFloat = 20
            let maxY: CGFloat = originY + heightView
            let leftUpPoint = CGPoint(x: halfImage, y: originY)
            // Setup complete, do drawing here
            context.setFillColor(UIColor.whiteAlpha70.cgColor)
            //CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
            //CGContextSetLineWidth(context, 2.0)
            context.beginPath()
        
            context.move(to: leftUpPoint)
            context.addLine(to: CGPoint(x: fullWidth, y: originY))
            context.addLine(to: CGPoint(x: fullWidth, y: maxY))
            context.addLine(to: CGPoint(x: halfImage, y: maxY))
            context.addLine(to: leftUpPoint)
            context.strokePath()
        }
    
        inImage.draw(in: CGRect(x: 0, y: 0, width: widthImage, height: heightImage))
        
        let rect = CGRect(x: widthImage + 2, y: 7, width: widthText, height: 12)
        let attr: AliasDict = selected ? shared.textAttrSelected : shared.textAttr
        text.draw(in: rect, withAttributes: attr)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext() ?? inImage
        UIGraphicsEndImageContext()
        
        cache.setObject(newImage, forKey: key)
        return newImage
    }
}
