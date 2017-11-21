//
//  RNSImageFactory+Draw.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSImageFactory {
    static func imageBusAt(_ text: String, selected: Bool, width: Float, isRight: Bool) -> UIImage {
        let inImage = bus_icon
        
        let key = "\(text) + \(selected.hashValue)" as NSString
        if let icon = cache.object(forKey: key) {
            return icon
        }
        let widthWing = CGFloat(width)
        
        let fullWidth = widthImage + widthWing
        UIGraphicsBeginImageContextWithOptions(CGSize(width: fullWidth, height: heightImage), false, scale)
        drawWing(fullWidth, selected: selected, isRight: isRight)
        drawImage(widthWing, isRight: isRight)
        drawText(text, selected: selected, widthWing: widthWing, isRight: isRight)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext() ?? inImage
        UIGraphicsEndImageContext()
        
        cache.setObject(newImage, forKey: key)
        return newImage
    }
    
    static func drawImage(_ widthWing: CGFloat, isRight: Bool) {
        let x = isRight ? 0 : widthWing
        bus_icon.draw(in: CGRect(x: x, y: 0, width: widthImage, height: heightImage))
    }
    
    static func drawWing(_ fullWidth: CGFloat, selected: Bool, isRight: Bool) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let colorView: UIColor = selected ? .color27AE60 : .whiteAlpha70
        let cgColor = colorView.cgColor
        let xEllipse = isRight ? (fullWidth - circleWidth) : 0
        
        drawTriangle(context, fullWidth: fullWidth, cgColor: cgColor, isRight: isRight)
        drawUpEllipse(context, x: xEllipse, cgColor: cgColor)
        drawDownEllipse(context, x: xEllipse, cgColor: cgColor)
    }
    
    static func drawTriangle(_ context: CGContext, fullWidth: CGFloat, cgColor: CGColor, isRight: Bool) {
        let delta = isRight ? halfImage : CGFloat(0)
        
        let xRightRight = fullWidth - halfImage + delta
        let xRightLeft = xRightRight - corner
        let xLeftRight = corner + delta
      
        context.beginPath()
        context.move(to: CGPoint(x: xLeftRight, y: originY))

        context.addLine(to: CGPoint(x: xRightLeft, y: originY))
        
        if isRight {
            
            context.addLine(to: CGPoint(x: xRightRight, y: originYСorner))
            context.addLine(to: CGPoint(x: xRightRight, y: yDownUp))
        }
        
        context.addLine(to: CGPoint(x: xRightLeft, y: maxY))
        context.addLine(to: CGPoint(x: xLeftRight, y: maxY))
        
        if !isRight {
            let xLeftLeft: CGFloat = delta
            context.addLine(to: CGPoint(x: xLeftLeft, y: yDownUp))
            context.addLine(to: CGPoint(x: xLeftLeft, y: originYСorner))
        }
 
        context.setFillColor(cgColor)
        context.fillPath()
 
 /*
        
        let rightDown = CGPoint(x: xRightRight, y: maxY)
        let rightUp = CGPoint(x: xRightRight, y: originY)
        let leftUp = CGPoint(x: 0, y: originY)
        let leftDown = CGPoint(x: 0, y: maxY)
        
        context.beginPath()
        context.move(to: rightDown)
        context.addArc(tangent1End: leftDown , tangent2End:  leftUp, radius: corner)
        context.addArc(tangent1End: leftUp, tangent2End: rightUp, radius: corner)
        context.addArc(tangent1End: rightUp , tangent2End: rightDown, radius: corner)
        context.addArc(tangent1End: rightDown , tangent2End: leftDown, radius: corner)
        context.setFillColor(cgColor)
        context.fillPath()
 */
    }
    
    static func drawUpEllipse(_ context: CGContext, x: CGFloat, cgColor: CGColor) {
        context.drawEllipse(CGRect(x: x, y: originY, width: circleWidth, height: circleWidth), color: cgColor)
    }
    
    static func drawDownEllipse(_ context: CGContext, x: CGFloat, cgColor: CGColor) {
        context.drawEllipse(CGRect(x: x, y: maxY - circleWidth, width: circleWidth, height: circleWidth), color: cgColor)
    }
    
    static func drawText(_ text: String, selected: Bool, widthWing: CGFloat, isRight: Bool) {
        let widthText = widthWing - betweenText - edgeText
        let x = isRight ? (widthImage + edgeText) : betweenText
        let rect = CGRect(x: x, y: 7, width: widthText, height: 12)
        let attr: AliasDict = selected ? shared.textAttrSelected : shared.textAttr
        text.draw(in: rect, withAttributes: attr)
    }
}
