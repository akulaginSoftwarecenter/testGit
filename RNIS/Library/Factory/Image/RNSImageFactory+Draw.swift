//
//  RNSImageFactory+Draw.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSImageFactory {
    static func imageBusAt(_ text: String, selected: Bool, width: Float, typeWing: TypeWing = .right) -> UIImage {
        let inImage = bus_icon
        
        let key = "\(text) + \(selected.hashValue)" as NSString
        if let icon = cache.object(forKey: key) {
            return icon
        }
        let widthWing = CGFloat(width)
        
        let fullWidth = widthImage + widthWing
        UIGraphicsBeginImageContextWithOptions(CGSize(width: fullWidth, height: heightImage), false, scale)
        
        drawWing(fullWidth, selected: selected)
        drawImage(widthWing, typeWing: typeWing)
        drawText(text, selected: selected, widthWing: widthWing)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext() ?? inImage
        UIGraphicsEndImageContext()
        
        cache.setObject(newImage, forKey: key)
        return newImage
    }
    
    static func drawImage(_ widthWing: CGFloat, typeWing: TypeWing = .right) {
        bus_icon.draw(in: CGRect(x: 0, y: 0, width: widthImage, height: heightImage))
    }
    
    static func drawWing(_ fullWidth: CGFloat, selected: Bool) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let colorView: UIColor = selected ? .color27AE60 : .whiteAlpha70
        let cgColor = colorView.cgColor
        
        drawTriangle(context, fullWidth: fullWidth, cgColor: cgColor)
        drawUpRightEllipse(context, fullWidth: fullWidth, cgColor: cgColor)
        drawDownRightEllipse(context, fullWidth: fullWidth, cgColor: cgColor)
    }
    
    static func drawTriangle(_ context: CGContext, fullWidth: CGFloat, cgColor: CGColor) {
        let xRightOneCorner = fullWidth - corner
        let upRightOneCorner = CGPoint(x: xRightOneCorner, y: originY)
        let upRightTwoCorner = CGPoint(x: fullWidth, y: yUpRightOneCorner)
        
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
    }
    
    static func drawUpRightEllipse(_ context: CGContext, fullWidth: CGFloat, cgColor: CGColor) {
        context.drawEllipse(CGRect(x: fullWidth - circleWidth, y: originY, width: circleWidth, height: circleWidth), color: cgColor)
    }
    
    static func drawDownRightEllipse(_ context: CGContext, fullWidth: CGFloat, cgColor: CGColor) {
        context.drawEllipse(CGRect(x: fullWidth - circleWidth, y: maxY - circleWidth, width: circleWidth, height: circleWidth), color: cgColor)
    }
    
    static func drawText(_ text: String, selected: Bool, widthWing: CGFloat, typeWing: TypeWing = .right) {
        let widthText = widthWing - betweenText - edgeText
        let x = typeWing.isRight ? (widthImage + edgeText) : betweenText
        let rect = CGRect(x: x, y: 7, width: widthText, height: 12)
        let attr: AliasDict = selected ? shared.textAttrSelected : shared.textAttr
        text.draw(in: rect, withAttributes: attr)
    }
}
