//
//  RNSMapViewController+Present.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapViewController {
    
    func present(_ vc: UIViewController?) {
        guard let containerVC = vc,
            let containerView = vc?.view else {
                return
        }
        addChildViewController(containerVC)
        view.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges()
        presentViewController = vc
    }
    
    var isHavePresent: Bool {
        return presentViewController != nil
    }
    
    func dismissOldPresentVC(complete: EmptyBlock? = nil) {
        presentViewController?.removeFromParentViewController()
        presentViewController?.view.removeFromSuperview()
        presentViewController = nil
        complete?()
    }
}
