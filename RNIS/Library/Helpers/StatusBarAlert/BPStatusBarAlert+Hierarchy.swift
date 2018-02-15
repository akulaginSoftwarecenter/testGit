//
//  File.swift
//  Spytricks
//
//  Created by Артем Кулагин on 22.11.2017.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation

// MARK: manage window hierarchy functions
extension BPStatusBarAlert {
    
    func adjustViewHierarchy(position: Position) {
        switch position {
        case .statusBar:
            addAlertViewInContainerWindow()
        case .navigationBar:
            addAlertViewInCurrentWindow()
        }
    }
    
    func addAlertViewInContainerWindow() {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return
        }
        containerWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: statusBarHeight))
        containerWindow?.backgroundColor = UIColor.clear
        containerWindow?.windowLevel = UIWindowLevelStatusBar
        containerWindow?.rootViewController = UIViewController()
        containerWindow?.rootViewController?.view.addSubview(self)
        containerWindow?.isHidden = false
    }
    
    func addAlertViewInCurrentWindow() {
        guard let keyWindow = UIApplication.shared.keyWindow,
            let rootViewController = keyWindow.rootViewController as? UINavigationController else {
                return
        }
        let navigationBar = rootViewController.navigationBar
        rootViewController.view.insertSubview(self, belowSubview: navigationBar)
    }
}
