//
//  RNSTriangle+Var.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Triangle + Var
 */


extension RNSTriangle {
    
    var size: CGSize {
        return self.layer.frame.size
    }
    
    var width: CGFloat {
        return size.width
    }
    
    var height: CGFloat {
        return size.height
    }
    
    var upLeftPoint: CGPoint {
        return CGPoint(x: 0, y: 0)
    }
    
    var upRightPoint: CGPoint {
        return CGPoint(x: width, y: 0)
    }
    
    var downLeftPoint: CGPoint {
        return CGPoint(x: 0, y: height)
    }
    
    var downRightPoint: CGPoint {
        return CGPoint(x: width, y: height)
    }
    
    var halfWidth: CGFloat {
        return width/2
    }
    
    var halfHeight: CGFloat {
        return height/2
    }
}
