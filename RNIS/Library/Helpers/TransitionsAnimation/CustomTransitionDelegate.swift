//
//  CustomTransitionDelegate.swift
//  RNIS
//
//  Created by IvanLazarev on 25/09/2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit


class CustomTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    static let shared = CustomTransitionDelegate()

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if presented is FadePresent {
            return FadePresentAnimationController()
        }
        return nil
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if dismissed is FadeDismiss {
            return FadeDismissAnimationController()
        }
        return nil
    }
}
