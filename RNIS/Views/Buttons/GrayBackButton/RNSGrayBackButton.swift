//
//  RNSGrayBackButton.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSGrayBackButton: BaseViewWithXIBInit {
    
    @IBOutlet var button: UIButton!
        
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
        guard let title = title else {
            return
        }
        button.setTitle(title, for: UIControlState())
    }
    
    @IBAction func action(_ sender: Any) {
        STRouter.pop()
    }
}
