//
//  BaseNavigationController.swift
//  Spytricks
//
//  Created by Артем Кулагин on 28.03.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController,UINavigationControllerDelegate {
    
    var completion: EmptyBlock? = nil
    
    func push(_ viewController:UIViewController, animated: Bool = false,
              completion:EmptyBlock? = nil) {
        self.completion = completion
        self.delegate = self
        pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool = false, completion:EmptyBlock? = nil) {
        self.completion = completion
        self.delegate = self
        popViewController(animated: animated)
    }
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        self.delegate = nil
        self.completion?()
    }
}
