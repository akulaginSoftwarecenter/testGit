//
//  RNSBlackButton.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Black Button
 */

class RNSBlackButton: BaseViewWithXIBInit {
    
    @IBOutlet var button: UIButton!
    var handlerAction: EmptyBlock?
    
    @IBInspectable var title: String? {
        didSet {
            prepareTitle()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareTitle()
    }
    
    func prepareTitle() {
        button.setTitle(title, for: UIControlState())
    }
    
    @IBAction func action(_ sender: Any) {
        handlerAction?()
    }
    
    override var nibNamed:String {
        return String(describing: RNSBlackButton.self)
    }
}
