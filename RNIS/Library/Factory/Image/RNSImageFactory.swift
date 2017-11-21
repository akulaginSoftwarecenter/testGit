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
    
    static let scale: CGFloat = UIScreen.main.scale
    static let font: UIFont = .cffazm12
    static let sizeImage = bus_icon.size
    static let widthImage = sizeImage.width
    static let heightImage = sizeImage.height
    static let halfImage = widthImage/2
    static let originY:CGFloat = 2
    static let corner:CGFloat = 5
    static let heightView: CGFloat = 20
    static let circleWidth = corner * 2
    
    lazy var maxY: CGFloat = {
        return originY + RNSImageFactory.heightView
    }()
    
    lazy var yUpRightOneCorner: CGFloat = {
        return originY + RNSImageFactory.corner
    }()
    
    lazy var leftUpPoint: CGPoint = {
        return CGPoint(x: RNSImageFactory.halfImage, y: originY)
    }()
    
    static func imageBusAt(_ text: String, selected: Bool, width: Float) -> UIImage {
        let inImage = bus_icon
        
        let key = "\(text) + \(selected.hashValue)" as NSString
        if let icon = cache.object(forKey: key) {
            return icon
        }
        let widthWing = CGFloat(width)
        let widthText = widthWing - 5
        let fullWidth = widthImage + widthWing
        UIGraphicsBeginImageContextWithOptions(CGSize(width: fullWidth, height: heightImage), false, scale)
        
        drawWing(fullWidth, selected: selected)
        drawImage()

        drawText(text, selected: selected, widthText: widthText)
       
        let newImage = UIGraphicsGetImageFromCurrentImageContext() ?? inImage
        UIGraphicsEndImageContext()
        
        cache.setObject(newImage, forKey: key)
        return newImage
    }
    
    static func drawImage() {
        bus_icon.draw(in: CGRect(x: 0, y: 0, width: widthImage, height: heightImage))
    }
    
    static func drawWing(_ fullWidth: CGFloat, selected: Bool) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let xRightOneCorner = fullWidth - corner
     
        let colorView: UIColor = selected ? .color27AE60 : .whiteAlpha70
        let cgColor = colorView.cgColor
        
        
        let upRightOneCorner = CGPoint(x: xRightOneCorner, y: originY)
        let upRightTwoCorner = CGPoint(x: fullWidth, y: yUpRightOneCorner)
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
        
        context.drawEllipse(CGRect(x: fullWidth - circleWidth, y: originY, width: circleWidth, height: circleWidth), color: cgColor)
        context.drawEllipse(CGRect(x: fullWidth - circleWidth, y: maxY - circleWidth, width: circleWidth, height: circleWidth), color: cgColor)
    }
    
    static func drawText(_ text: String, selected: Bool, widthText: CGFloat) {
        let rect = CGRect(x: widthImage + 2, y: 7, width: widthText, height: 12)
        let attr: AliasDict = selected ? shared.textAttrSelected : shared.textAttr
        text.draw(in: rect, withAttributes: attr)
    }
}
