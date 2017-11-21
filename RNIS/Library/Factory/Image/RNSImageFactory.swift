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
    
    static func imageBusAt(_ text: String, selected: Bool, widthText: CGFloat) -> UIImage {
        let inImage = bus_icon
        
        let key = "\(text) + \(selected.hashValue)" as NSString
        if let icon = cache.object(forKey: key) {
            return icon
        }
        
        let scale = UIScreen.main.scale
        let sizeImage = inImage.size
        let widthImage = sizeImage.width
        let heightImage = sizeImage.height
        let fullWidth = widthImage + widthText + 5
        let size = CGSize(width: fullWidth, height: heightImage)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        if let context = UIGraphicsGetCurrentContext() {
            let halfImage = widthImage/2
            let originY:CGFloat = 2
            let corner:CGFloat = 5
            let heightView: CGFloat = 20
            let maxY: CGFloat = originY + heightView
            let leftUpPoint = CGPoint(x: halfImage, y: originY)
            let xRightOneCorner = fullWidth - corner
            let yUpRightOneCorner = originY + corner
            let upRightOneCorner = CGPoint(x: xRightOneCorner, y: originY)
            let upRightTwoCorner = CGPoint(x: fullWidth, y: yUpRightOneCorner)
            let circleWidth = corner * 2
            let colorView: UIColor = selected ? .color27AE60 : .whiteAlpha70
            let cgColor = colorView.cgColor
            
            let yDownRightOneCorner = maxY - corner
            
            context.beginPath()
            context.move(to: leftUpPoint)
            
            context.addLine(to: upRightOneCorner)
            context.addLine(to: upRightTwoCorner)
            
            context.addLine(to: CGPoint(x: fullWidth, y: yDownRightOneCorner))
            context.addLine(to: CGPoint(x: xRightOneCorner, y: maxY))
            
            context.addLine(to: CGPoint(x: halfImage, y: maxY))
            context.addLine(to: leftUpPoint)
            context.setFillColor(cgColor)
            context.fillPath()
 
            context.beginPath()
            context.addEllipse(in: CGRect(x: fullWidth - circleWidth, y: originY, width: circleWidth, height: circleWidth))
            context.setFillColor(cgColor)
            context.fillPath()
            
            context.beginPath()
            context.addEllipse(in: CGRect(x: fullWidth - circleWidth, y: maxY - circleWidth, width: circleWidth, height: circleWidth))
            context.setFillColor(cgColor)
            context.fillPath()
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
