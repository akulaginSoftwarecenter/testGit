//
//  BPStatusBarAlert+Setup.swift
//  Spytricks
//
//  Created by Артем Кулагин on 22.11.2017.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation

// MARK: setup function
extension BPStatusBarAlert {
    
    func frame(position: Position) -> CGRect {
        var frame = CGRect()
        switch position {
        case .statusBar:
            frame = CGRect(x: 0.0, y: -statusBarHeight, width: screenWidth, height: statusBarHeight)
        case .navigationBar:
            frame = CGRect(x: 0.0, y: navigationBarHeight, width: screenWidth, height: statusBarHeight)
        }
        return frame
    }
    
    func setupView(position: Position) {
        //self.backgroundColor = UIColor.bgColor
        self.position = position
        frame = frame(position: position)
    }
    
    func setupMessageLabel() {
        messageLable.frame = CGRect(x: 10.0, y: 0.0, width: frame.size.width - 10.0, height: statusBarHeight)
        messageLable.textColor = .white
        messageLable.textAlignment = .center
        messageLable.numberOfLines = 0
        messageLable.font = .cffazm14
        messageLable.backgroundColor = UIColor.clear
        messageLable.text = ""
        addSubview(messageLable)
    }
}
