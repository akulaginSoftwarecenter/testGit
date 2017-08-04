//
//  UIViewController+Navigation.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension UIViewController {
    
    func pushAnimated() {
        STRouter.pushAnimated(self)
    }
    
    func pushAnimatedRedScroll() {
        STRouter.pushAnimatedRedScroll(self)
    }
}
