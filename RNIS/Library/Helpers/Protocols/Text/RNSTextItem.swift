//
//  RNSTextItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Протокол для текста
 */
protocol RNSTextItem: class {
    var name: String? { get set }
    
    func heightAtWidth(_ width: CGFloat) -> CGFloat

}
