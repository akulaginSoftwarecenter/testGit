//
//  RNSTwoBtnAlert.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSTwoBtnAlert: BaseViewWithXIBInit {
    
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
      
    var handlerLeft: EmptyBlock?
    var handlerRight: EmptyBlock?
    
    convenience init(_ leftTitle: String? = "OK", _ rightTitle: String? = "ОТМЕНА") {
        self.init(frame: CGRect.zero)
        
        backgroundColor = .EA4845
        leftBtn.setTitle(leftTitle, for: UIControlState())
        rightBtn.setTitle(rightTitle, for: UIControlState())
        
        snp.makeConstraints { (make) in
            make.height.equalTo(59)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        roundBottomCorners()
    }
    
    @IBAction func leftAction(_ sender: Any) {
        handlerLeft?()
    }
    
    @IBAction func rightAction(_ sender: Any) {
        handlerRight?()
    }
}
