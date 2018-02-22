//
//  RNSScrollShowContainer+Scroll.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы со скролом
 */
extension RNSScrollShowContainer {
    
    func scrollToTop(_ animated: Bool = true) {
        scrollTo(topOffset, animated: animated)
    }
    
    func scrollToStart(_ animated: Bool = true) {
        startOverTopDeselerateFalse()
        scrollTo(startBottomOffset, animated: animated)
    }
    
    func scrollToBottom() {
        scrollTo(bottomOffset)
    }
    
    func scrollTo(_ offset: CGFloat, animated: Bool = true) {
        scrollView.setContentOffset(CGPoint(x: 0, y: offset), animated: animated)
    }
}
