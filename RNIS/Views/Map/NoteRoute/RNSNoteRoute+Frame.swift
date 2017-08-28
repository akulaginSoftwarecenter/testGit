//
//  RNSNoteRoute+Frame.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSNoteRoute {
    var widthText: CGFloat {
        guard let font = titleLabel.font,
            let text = titleLabel.text else {
                return 0
        }
        return text.width(font) + 22
    }
    
    var xT: CGFloat {
        return self.type == .left ? wightArrow : 0
    }
    
    var yT: CGFloat {
        return self.type == .up ? wightArrow : 0
    }
    
    var heightT: CGFloat {
        return CGFloat(30)
    }
    
    func prepareFrame() {
        frame = CGRect(x: xT, y: yT, width: widthText, height: heightT)
    }
}
