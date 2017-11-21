//
//  RNSImageFactory+var.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSImageFactory {
    
    static var maxY: CGFloat  {
        return shared.maxY
    }
    
    static var yUpRightOneCorner: CGFloat  {
        return shared.yUpRightOneCorner
    }
    
    static var leftUpPoint: CGPoint  {
        return shared.leftUpPoint
    }
    
    var originY: CGFloat {
        return RNSImageFactory.originY
    }
    
   
    func textFontAttributes(_ selected: Bool) -> AliasDict  {
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let color: UIColor = selected ? .white : .color424242
        return [
            NSAttributedStringKey.font: RNSImageFactory.font,
            NSAttributedStringKey.foregroundColor: color,
            NSAttributedStringKey.paragraphStyle: style,
        ]
    }
}
