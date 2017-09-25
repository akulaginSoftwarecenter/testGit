//
//  FadePresentAnimationController.swift
//  RNIS
//
//  Created by IvanLazarev on 25/09/2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit


protocol FadePresent: class {}
protocol FadeDismiss: class {}


class FadePresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        transitionContext.containerView.addSubview(toVC.view)
        let contentView = toVC.view.subviews.first!
        let targetBGColor = toVC.view.backgroundColor
        let targetY = contentView.frame.origin.y

        toVC.view.backgroundColor = UIColor.clear
        contentView.frame.origin.y = toVC.view.bounds.maxY
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toVC.view.backgroundColor = targetBGColor
            contentView.frame.origin.y = targetY
        }) { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
