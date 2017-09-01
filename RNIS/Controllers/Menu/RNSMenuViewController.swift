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
            self.rootViewController?.view.frame = self.view.bounds
        }
    }
    
    override func awakeFromNib(){
        super.awakeFromNib()
        
        leftViewController = RNSRedContainer(RNSLeftMenuController.initialController)
        
        prepareHandlers()
        RNSMenuManager.showFirst()
        
        let menuWidth = UIScreen.width - 123
        leftViewWidth = menuWidth
        leftViewPresentationStyle = .slideBelow
        leftViewAlwaysVisibleOptions = LGSideMenuAlwaysVisibleOptions()
        isLeftViewSwipeGestureEnabled = true
    }
    
    override func leftViewWillLayoutSubviews(with size: CGSize) {
        super.leftViewWillLayoutSubviews(with: size)
        
        leftViewController?.view.frame = CGRect(origin: CGPoint.zero, size: size)
    }
    
    func showVC(_ vc: UIViewController?) {
        guard let vc = vc else {
            return
        }
        if rootViewController != vc {
            rootViewController = vc
        }
        hideLeftView(animated: true)
    }
    
    override class var storyboardName: String {
        return "RNSMenuViewController"
    }
}
