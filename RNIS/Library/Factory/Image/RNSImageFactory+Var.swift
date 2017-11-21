//
//  RNSImageFactory+var.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSImageFactory {

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
