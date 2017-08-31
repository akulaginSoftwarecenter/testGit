//
//  RNSNoteRoute+Var.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSNoteRoute {
    var widthText: CGFloat {
        guard let font = titleLabel.font,
            let text = titleLabel.text else {
                return 0
        }
        let edge: CGFloat = isHaveDistance ? 8 : 22
        return text.width(font) + edge
    }
    
    var xT: CGFloat {
        return type == .left ? arrow : 0
    }
    
    var yT: CGFloat {
        return type == .up ? arrow : 0
    }
    
    
    var widthType: CGFloat {
        var widthText = self.widthText
        if type == .left || type == .right {
            widthText += arrow
        }
        return widthText
    }
    
    
    var heightType: CGFloat {
        var height = backViewHeight
        if type == .up || type == .down {
            height += arrow
        }
        return height
    }
    
    var size: CGSize {
        return frame.size
    }
    
    var height: CGFloat {
        return size.height
    }
    
    var width: CGFloat {
        return size.width
    }
    
    var isHaveDistance: Bool {
        return distance != nil
    }
    
    var backViewHeight: CGFloat {
        var height = textHeight
        if isHaveDistance {
            height += 9
        }
        return height
   }
}
