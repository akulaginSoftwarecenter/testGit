//
//  RNSTriangle.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

enum TypeNote: Int {
    case left = 0,
         up = 1,
         right = 2,
         down = 3
}

class RNSTriangle: UIView {
    
    @IBInspectable var typeNote: Int = 0

    override func draw(_ rect: CGRect) {
        let layer = self.layer
        let mask = CAShapeLayer()
        mask.frame = layer.bounds
        
        let path = CGMutablePath()
        drawTriangle(path)
        
        mask.path = path
        self.layer.mask = mask
    }
    
    func drawTriangle(_ path: CGMutablePath) {
        let type = TypeNote(rawValue: typeNote) ?? .left
        switch type {
        case .left:
            drawLeft(path)
            break
        case .up:
            drawUp(path)
            break
        case .right:
            drawRight(path)
            break
        case .down:
            drawDown(path)
            break
        }
    }
}