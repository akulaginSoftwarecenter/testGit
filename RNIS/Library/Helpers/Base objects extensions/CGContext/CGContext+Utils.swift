//
//  CGContext+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для CGContext
 */
extension CGContext {
    
    func drawEllipse(_ rect: CGRect, color: CGColor) {
        beginPath()
        addEllipse(in: rect)
        setFillColor(color)
        fillPath()
    }
}
