//
//  UIViewController+Navigation.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension UIViewController {
    
    func pushAnimated(completion: EmptyBlock? = nil) {
        STRouter.pushAnimated(self, completion: completion)
    }
    
    func pushAnimatedRedScroll() {
        STRouter.pushAnimatedRedScroll(self)
    }
    
    func pushAnimatedImageBoard() {
        STRouter.pushAnimatedImageBoard(self)
    }
   
    static func initialPushAnimatedRed() {
        return initialController.pushAnimatedRed()
    }
    
    func pushAnimatedRed() {
        STRouter.pushAnimatedRed(self)
    }
    
    func pushAnimated() {
        STRouter.pushAnimated(self)
    }
}
