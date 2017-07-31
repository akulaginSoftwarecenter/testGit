//
//  RNSLoginView.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSLoginView: BaseViewWithXIBInit {

    @IBOutlet weak var blackButton: RNSBlackButton!
    @IBOutlet weak var titleTop: UILabel!
    
    var handlerBlackAction: EmptyBlock? {
        get {
            return nil
        }
        set {
            blackButton.handlerAction = handlerBlackAction
        }
    }
    
    @IBInspectable var titleBlackButton: String {
        get { return "" }
        set {
            blackButton.title = newValue
        }
    }
    
    @IBInspectable var titleTextTop: String {
        get { return "" }
        set {
            self.titleTop.text = newValue
        }
    }
}
