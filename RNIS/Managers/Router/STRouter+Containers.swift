//
//  STRouter+Containers.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

extension STRouter {
    
    static func boardContainer(_ viewController: UIViewController?) -> UIViewController? {
        return KeyBoardViewController(viewController)
    }
    
    static func imageContainer(_ viewController: UIViewController?) -> UIViewController? {
        return STImageContainer(viewController)
    }
    
    static func redContainer(_ viewController: UIViewController?) -> UIViewController? {
        return RNSRedContainer(viewController)
    }
    
    static func imageBoardContainer(_ viewController: UIViewController?) -> UIViewController? {
        return imageContainer(boardContainer(viewController))
    }
}
