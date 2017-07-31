//
//  UITapGestureRecognizer+Listener.swift
//  Solity-iOS
//
//  Created by Vlad on 17.12.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

extension UITapGestureRecognizer: EventDispatcher
{
    func addTapListener() {
        addTarget(self, action: #selector(tapHandler))
    }
    
    func tapHandler() {
        dispatchEvent(Event(target: self))
    }
}
