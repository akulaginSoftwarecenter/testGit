//
//  RNSScrollShowContainer+Offset.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSScrollShowContainer {
    
    func scrollToStart() {
        scrollTo(UIScreen.height/3)
    }
    
    func scrollToBottom() {
        scrollTo(0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        prepareTouchView()
    }
    
    func scrollTo(_ offset: CGFloat) {
        scrollView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
    }
}
