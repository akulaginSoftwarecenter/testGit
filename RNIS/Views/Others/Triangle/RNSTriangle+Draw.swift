//
//  RNSTriangle+Draw.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Triangle + Draw
 */
extension RNSTriangle {
    
    func drawLeft(_ path: CGMutablePath) {
        path.move(to: upRightPoint)
        path.addLine(to: downRightPoint)
        path.addLine(to: CGPoint(x: 0, y: halfHeight))
        path.addLine(to: upRightPoint)
    }
    
    func drawUp(_ path: CGMutablePath) {
        path.move(to: downLeftPoint)
        path.addLine(to: downRightPoint)
        path.addLine(to: CGPoint(x: halfWidth, y: 0))
        path.addLine(to: downLeftPoint)
    }
    
    func drawRight(_ path: CGMutablePath) {
        path.move(to: upLeftPoint)
        path.addLine(to: downLeftPoint)
        path.addLine(to: CGPoint(x: width, y: halfHeight))
        path.addLine(to: upLeftPoint)
    }
    
    func drawDown(_ path: CGMutablePath) {
        path.move(to: upLeftPoint)
        path.addLine(to: upRightPoint)
        path.addLine(to: CGPoint(x: halfWidth, y: height))
        path.addLine(to: upLeftPoint)
    }
}
