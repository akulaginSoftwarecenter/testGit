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

/**
 Треугольник
 */
class RNSTriangle: UIView {
    
    @IBInspectable var typeNote: Int = 0
    
    /// Создание треугольника
    ///
    /// - Parameter type: тип треугольника
    convenience init(_ type: TypeNote) {
        self.init(frame: CGRect.zero)
        typeNote = type.rawValue
        isHidden = true
        frame.size = CGSize(width: 9, height: 9)
    }

    override func draw(_ rect: CGRect) {
        let layer = self.layer
        let mask = CAShapeLayer()
        mask.frame = layer.bounds
        
        let path = CGMutablePath()
        drawTriangle(path)
        
        mask.path = path
        self.layer.mask = mask
    }
    
    /// Рисование треугольника
    ///
    /// - Parameter path: путь
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
