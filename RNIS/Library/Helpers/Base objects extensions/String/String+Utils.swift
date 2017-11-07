//
//  String+Utils.swift
//  Spytricks
//
//  Created by Артем Кулагин on 17.03.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation
import UIKit

extension String{
    var last10:String {
        return String(suffix(10))
    }
    
    func width(_ font: UIFont) -> CGFloat {
        let floatMax = CGFloat.greatestFiniteMagnitude
        let frame = rectWithFont(font, size: CGSize(width: floatMax, height: floatMax))
        return frame.width;
    }
    
    func height(_ font: UIFont, width: CGFloat) -> CGFloat {
        let frame = rectWithFont(font, size: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        return frame.height;
    }
    
    func rectWithFont(_ font: UIFont, size: CGSize) -> CGRect {
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = .byWordWrapping
        let attributes = [NSAttributedStringKey.foregroundColor:UIColor.black,
                          NSAttributedStringKey.font:font,
                          NSAttributedStringKey.paragraphStyle:style];
        return self.boundingRect(with: size, options: [.usesLineFragmentOrigin,.usesFontLeading]
            , attributes: attributes, context: nil)
    }
}
