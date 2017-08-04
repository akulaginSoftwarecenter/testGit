//
//  STRouter.swift
//  Spytricks
//
//  Created by Артем Кулагин on 10.02.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit

class STRouter: NSObject {
    
    static let shared = STRouter()
    
    static var rootViewController:BaseNavigationController? {
        return UIApplication.shared.delegate!.window!!.rootViewController as! BaseNavigationController?
    }
    
    static var rootView: UIView? {
        return rootViewController?.view
    }
    
    static var viewControllers: [UIViewController]? {
        return rootViewController?.viewControllers
    }
    
    static func push(_ viewController: UIViewController?,
                             animated: Bool = false,
                           completion: EmptyBlock? = nil) {
        guard let viewController = viewController else {
            return
        }
        rootViewController?.push(viewController, animated: animated, completion: completion)
    }
    
    static func pushAnimated(_ viewController: UIViewController?,
                                   completion: EmptyBlock? = nil) {
        push(viewController, animated: true, completion: completion)
    }
    
    static func pop(animated: Bool = true, completion: EmptyBlock? = nil) {
        rootViewController?.pop(animated: animated, completion: completion)
    }
    
    static func present(_ viewControllerToPresent:UIViewController?, animated: Bool = true) {
        guard var vc:UIViewController = rootViewController,
            let viewControllerToPresent = viewControllerToPresent  else {
            return
        }
       
        while let presented = vc.presentedViewController {
            vc = presented
        }
        viewControllerToPresent.modalPresentationStyle = .overCurrentContext
        vc.present(viewControllerToPresent, animated: animated)
    }
    
    static func clearNav() {
        rootViewController?.viewControllers.removeAll()
    }
    
    static func pushAnimatedImageBoard(_ viewController: UIViewController?) {
        pushAnimated(imageBoardContainer(viewController))
    }
    
    static func pushAnimatedRedScroll(_ viewController: UIViewController?) {
        pushAnimated(redScrollContainer(viewController))
    }
}
