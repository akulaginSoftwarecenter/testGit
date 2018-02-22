//
//  UIViewController+Navigation.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для UIViewController
 */
extension UIViewController {
    
    func pushAnimated(completion: EmptyBlock? = nil) {
        STRouter.pushAnimated(self, completion: completion)
    }
    
    func pushAnimatedRedScroll() {
        STRouter.pushAnimatedRedScroll(self)
    }
    
    func pushAnimatedImageBoard(animated: Bool = true) {
        STRouter.pushAnimatedImageBoard(self, animated: animated)
    }
    
    func pushAnimatedImageScroll() {
        STRouter.pushAnimatedImageScroll(self)
    }
    
    func pushAnimatedRed() {
        STRouter.pushAnimatedRed(self)
    }
    
    func pushAnimated() {
        STRouter.pushAnimated(self)
    }
    
    func push(_ animated: Bool = false,
              completion: EmptyBlock? = nil) {
        STRouter.push(self, animated: animated, completion: completion)
    }
    
    static func controllerPush() {
        controller?.push()
    }
    
    static func initialPushAnimatedRed() {
        initialController?.pushAnimatedRed()
    }
    
    static func initialPushAnimatedRedScroll() {
        initialController?.pushAnimatedRedScroll()
    }
}
