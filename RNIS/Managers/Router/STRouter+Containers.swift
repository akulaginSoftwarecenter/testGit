//
//  STRouter+Containers.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Расширение для работы с контейнер
 */
extension STRouter {
    
    static func boardContainer(_ viewController: UIViewController?) -> UIViewController? {
        return KeyBoardViewController(viewController)
    }
    
    static func imageContainer(_ viewController: UIViewController?) -> UIViewController? {
        return redContainer(viewController)
    }
    
    static func redContainer(_ viewController: UIViewController?) -> UIViewController? {
        return RNSRedContainer(viewController)
    }
    
    static func scrollContainer(_ viewController: UIViewController?, isNeedAddTap: Bool = true) -> RNSScrollKeyBoardContainer? {
        return RNSScrollKeyBoardContainer.initController(viewController, isNeedAddTap: isNeedAddTap) 
    }
    
    static func imageScrollContainer(_ viewController: UIViewController?) -> UIViewController? {
        return imageContainer(scrollContainer(viewController))
    }
    
    static func imageBoardContainer(_ viewController: UIViewController?) -> UIViewController? {
        return imageContainer(boardContainer(viewController))
    }
    
    static func redScrollContainer(_ viewController: UIViewController?) -> UIViewController? {
        return redContainer(scrollContainer(viewController))
    }
    
    static func scrollShowContainer(_ viewController: UIViewController?, topTitle: String? = nil) -> RNSScrollShowContainer? {
        return RNSScrollShowContainer.initController(viewController,topTitle: topTitle)
    }
}
