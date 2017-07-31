//
//  KeyboardShowable+Tap.swift
//  Solity-iOS
//
//  Created by Vlad on 30.11.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

extension KeyboardShowable
{
    func addTapGesture(_ selector: String? = nil) {
        let tap = UITapGestureRecognizer()
        if let _ = selector {
            tap.addTarget(self, action: NSSelectorFromString(selector!))
        } else {
            tap.addTapListener()
            let tapHandler = EventHandler(function: {
                (event: Event) in
                self.hideKeyboardByTap()
            })
            tap.addEventListener(tapHandler)
        }
        view?.addGestureRecognizer(tap)
    }
}
