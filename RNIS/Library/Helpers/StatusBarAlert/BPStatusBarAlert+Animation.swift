//
//  BPStatusBarAlert+Animation.swift
//  Spytricks
//
//  Created by Артем Кулагин on 22.11.2017.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation

// MARK: animation functions
extension BPStatusBarAlert {
    
    func startAnimation(completion: @escaping () -> Void) {
        guard !isShowing else {
            return
        }
        isShowing = true
        
        UIView.animate(withDuration: duration, animations: {
            switch self.position {
            case .statusBar:
                self.frame.origin.y = 0
            case .navigationBar:
                self.frame.origin.y = self.navigationBarHeight + self.statusBarHeight
            }
            self.layoutIfNeeded()
        }) { _ in
            completion()
        }
    }
    
    func finishAnimating() {
        UIView.animate(withDuration: duration, animations: {
            switch self.position {
            case .statusBar:
                self.frame.origin.y = -self.statusBarHeight
            case .navigationBar:
                self.frame.origin.y = self.navigationBarHeight
            }
            self.layoutIfNeeded()
        }) { _ in
            self.isShowing = false
            self.containerWindow?.isHidden = true
            self.completion?()
        }
    }
}
