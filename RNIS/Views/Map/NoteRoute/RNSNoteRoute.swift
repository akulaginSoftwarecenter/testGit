//
//  RNSNoteRoute.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSNoteRoute: BaseViewWithXIBInit {

    @IBOutlet weak var leftView: RNSTriangle!
    @IBOutlet weak var upView: RNSTriangle!
    @IBOutlet weak var rightView: RNSTriangle!
    @IBOutlet weak var downView: RNSTriangle!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var backView: UIView!
    
    @discardableResult convenience init(busTitle: String?) {
        self.init()
        
        titleLabel.text = busTitle
        prepareUIBus()
    }
    
    func prepareUIBus() {
        titleLabel.font = .cffazm20
        titleLabel.textColor = .white
        
        prepareColor(.A3423C)
    }
    
    @discardableResult convenience init(durationMinute: Int?) {
        self.init()
        
        titleLabel.text = "\(durationMinute ?? 0) мин."
        prepareMinute()
    }
    
    func prepareMinute() {
        titleLabel.font = .cffazm18
        titleLabel.textColor = .F1645A
        
        prepareColor(.white)
    }
    
    func prepareColor(_ color: UIColor) {
        backView.backgroundColor = color
        leftView.backgroundColor = color
        upView.backgroundColor = color
        rightView.backgroundColor = color
        downView.backgroundColor = color
    }
}

