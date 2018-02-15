//
//  BPStatusBarAlert+Functions.swift
//  Spytricks
//
//  Created by Артем Кулагин on 22.11.2017.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation

// MARK: chaning function and show / hide functions
extension BPStatusBarAlert {
    
    public func message(message: String) -> Self {
        self.messageLable.text = message
        return self
    }
    
    public func messageColor(color: UIColor) -> Self {
        self.messageLable.textColor = color
        return self
    }
    
    public func bgColor(color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    public func completion(_ completion: @escaping () -> Void) -> Self {
        self.completion = completion
        return self
    }
    
    public func show() {
        adjustViewHierarchy(position: position)
        
        startAnimation {
            DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
                self.finishAnimating()
            }
        }
    }
}
