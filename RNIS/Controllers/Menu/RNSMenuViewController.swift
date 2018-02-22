//
//  RNSMenuViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import LGSideMenuController

/**
 Контроллер, который служит контейнером для меню
 */
class RNSMenuViewController: LGSideMenuController {

    override open var rootViewController: UIViewController? {
        didSet{
            fatalError("Don't use this method, use baseNavigationController.setViewControllers(:animated:) instead")
        }
    }

    /// Контроллер навигации
    var root: BaseNavigationController? {
        return rootViewController as? BaseNavigationController
    }
    
    /// метод обработки загрузки вью
    override func awakeFromNib(){
        super.awakeFromNib()
        
        prepareUI()
        prepareHandlers()
        RNSMenuManager.showFirst()
    }

    func prepareUI() {
        leftViewController = RNSRedContainer(RNSLeftMenuController.initialController)
        
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
    
    /// Показать контроллер
    ///
    /// - Parameter vc: контроллер
    func showItem(_ item: MenuItem?) {
        guard let item = item,
            let vc = item.vc else {
            return
        }
        if root != vc {
            super.rootViewController = vc
            STRouter.rootViewController = vc
        }
        hideLeftView(animated: true)
    }
}
