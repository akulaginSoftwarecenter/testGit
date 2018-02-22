//
//  UIViewController+Storyboards.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для UIViewController
 */
extension UIViewController {
    
    static var initialController: UIViewController? {
        return initialControllerTypeAt()
    }
    
    static func initialControllerType() -> Self? {
        return initialControllerTypeAt()
    }
    
    static func initialControllerTypeAt<T>() -> T? {
        return storyboard.instantiateInitialViewController() as? T
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: nil)
    }
    
    static var controller: UIViewController? {
        return controllerType()
    }
    
    static func controllerType() -> Self? {
        return controllerTypeAt()
    }
    
    static func controllerTypeAt<T>() -> T? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as? T
    }
    
    @objc class var storyboardName: String {
        return self.storyboardIdentifier
    }
    
    @objc class var storyboardIdentifier: String {
        return Utils.stringFromSwiftClass(self)
    }
    
    static var initialRed: UIViewController? {
        return STRouter.redContainer(initialController)
    }
}
