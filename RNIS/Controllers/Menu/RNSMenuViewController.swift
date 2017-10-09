//
//  RNSMenuViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import LGSideMenuController

class RNSMenuViewController: LGSideMenuController {

    override open var rootViewController: UIViewController? {
        didSet{
            fatalError("Don't use this method, use baseNavigationController.setViewControllers(:animated:) instead")
        }
    }

    var baseNavigationController: BaseNavigationController!
    
    override func awakeFromNib(){
        super.awakeFromNib()
        
        leftViewController = RNSRedContainer(RNSLeftMenuController.initialController)
        
        let menuWidth = UIScreen.width - 123
        leftViewWidth = menuWidth
        leftViewPresentationStyle = .slideBelow
        leftViewAlwaysVisibleOptions = LGSideMenuAlwaysVisibleOptions()
        isLeftViewSwipeGestureEnabled = true

        baseNavigationController = STRouter.rootViewController
        super.rootViewController = baseNavigationController
        baseNavigationController.view.frame = view.bounds
        baseNavigationController.setNavigationBarHidden(true, animated: false)

        prepareHandlers()
        RNSMenuManager.showFirst()
    }
    
    override func leftViewWillLayoutSubviews(with size: CGSize) {
        super.leftViewWillLayoutSubviews(with: size)
        
        leftViewController?.view.frame = CGRect(origin: CGPoint.zero, size: size)
    }
    
    func showVC(_ vc: UIViewController?) {
        guard let vc = vc else {
            return
        }
        if baseNavigationController.viewControllers.first != vc {
            baseNavigationController.setViewControllers([vc], animated: true)
        } else {
            baseNavigationController.popToRootViewController(animated: true)
        }
        hideLeftView(animated: true)
    }
    
    override class var storyboardName: String {
        return "RNSMenuViewController"
    }
}
