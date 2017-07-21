//
//  UIViewController+Storyboards.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension UIViewController {
    
    static var initialController: UIViewController {
        return storyboard.instantiateInitialViewController()!
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: nil)
    }
    
    static var controller: UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier)
    }
    
    class var storyboardName: String {
        return "Main"
    }
    
    class var storyboardIdentifier: String {
        return Utils.stringFromSwiftClass(self)
    }
}
