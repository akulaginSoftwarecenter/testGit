//
//  RNSTriangle+Draw.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSTriangle {
    
    func drawLeft(_ path: CGMutablePath) {
        path.move(to: upRightPoint)
        path.move(to: downRightPoint)
        path.move(to: CGPoint(x: 0, y: halfHeight))
        path.move(to: upRightPoint)
    }
    
    func drawUp(_ path: CGMutablePath) {
        path.move(to: downLeftPoint)
        path.move(to: downRightPoint)
        path.move(to: CGPoint(x: halfWidth, y: 0))
        path.move(to: downLeftPoint)
    }
    
    func drawRight(_ path: CGMutablePath) {
        path.move(to: upLeftPoint)
        path.move(to: upRightPoint)
        path.move(to: CGPoint(x: width, y: halfHeight))
        path.move(to: upLeftPoint)
    }
    
    func drawDown(_ path: CGMutablePath) {
        path.move(to: upLeftPoint)
        path.move(to: upRightPoint)
        path.move(to: CGPoint(x: halfWidth, y: height))
        path.move(to: upLeftPoint)
    }
}
