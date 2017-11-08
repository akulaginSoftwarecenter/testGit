//
//  RNSTextField+Set.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSTextField {
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: bounds.width - leftInset, height: bounds.height)
    }
}
