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
    
    lazy var yDownRightOneCorner: CGFloat = {
        return maxY - RNSImageFactory.corner
    }()
}
