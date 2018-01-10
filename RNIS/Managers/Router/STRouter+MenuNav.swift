//
//  STRouter+MenuNav.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

extension STRouter {
    
    static var rootMain: BaseNavigationController? {
        return UIApplication.shared.delegate?.window??.rootViewController as? BaseNavigationController
    }
    
    static func pushMain(_ viewController: UIViewController?, animated: Bool = true, completion: EmptyBlock? = nil) {
        rootMain?.push(viewController, animated: animated, completion:completion)
    }
    
    static func popMain(animated: Bool = true, completion: EmptyBlock? = nil) {
        rootMain?.pop(animated: animated, completion: completion)
    }
    
    static func popToRootMain(_ animated: Bool = true, completion:EmptyBlock? = nil) {
        rootMain?.popToRoot(animated: animated, completion: completion)
    }
}
