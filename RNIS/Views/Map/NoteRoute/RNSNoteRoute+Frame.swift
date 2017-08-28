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
        var height = CGFloat(30)
        if type == .up || type == .down {
            height += arrow
        }
        return height
    }
    
    var height: CGFloat {
        return frame.size.height
    }
    
    var width: CGFloat {
        return frame.size.width
    }
    
    func prepareFrame() {
        frame = CGRect(x: 0, y: 0, width: widthType, height: heightType)
        prepareFrameTitle()
        prepareTriangle()
    }
    
    func prepareFrameTitle() {
        titleLabel.frame = CGRect(x: xT, y: yT, width: widthText, height: textHeight)
        titleLabel.layer.cornerRadius = 5
        titleLabel.clipsToBounds = true
        titleLabel.layer.masksToBounds = true
    }
   
    func prepareTriangle() {
        let halfHeight = (height - arrow)/2
        let halfWidth = (width - arrow)/2
        switch type {
        case .left:
            leftView.frame.origin = CGPoint(x: 0, y: halfHeight)
            leftView.isHidden = false
            break
        case .up:
            upView.frame.origin = CGPoint(x: halfWidth, y: 0)
            upView.isHidden = false
            break
        case .right:
            rightView.frame.origin = CGPoint(x: width - arrow, y: halfHeight)
            rightView.isHidden = false
            break
        case .down:
            downView.frame.origin = CGPoint(x: halfWidth, y: height - arrow)
            downView.isHidden = false
            break
        }
    }
}
