//
//  FadeDismissAnimationController.swift
//  RNIS
//
//  Created by IvanLazarev on 25/09/2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс анимации исчезновения
 */
class FadeDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    /// Метод возврата времение анимации
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }

    /// Метод анимации контроллера
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        let contentView = fromVC.view.subviews.first!
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromVC.view.backgroundColor = UIColor(white: 0, alpha: 0)
            contentView.frame.origin.y = fromVC.view.bounds.maxY
        }) { _ in
            fromVC.view.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
