//
//  CustomTransitionDelegate.swift
//  RNIS
//
//  Created by IvanLazarev on 25/09/2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс делегата анимации перехода
 */
class CustomTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    /// переменная синглетона
    static let shared = CustomTransitionDelegate()

    /// Метод анимации появления
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if presented is FadePresent {
            return FadePresentAnimationController()
        }
        return nil
    }

    /// Метод анимации исчезновения
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if dismissed is FadeDismiss {
            return FadeDismissAnimationController()
        }
        return nil
    }
}
