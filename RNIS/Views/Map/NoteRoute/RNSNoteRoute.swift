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
    
    var type: TypeNote = .left
    
    let wightArrow = CGFloat(9)
    
    @discardableResult convenience init(busTitle: String?, type: TypeNote) {
        self.init()
        
        titleLabel.text = busTitle
        self.type = type
        prepareUIBus()
        prepareFrame()
    }
    
    @discardableResult convenience init(durationMinute: Int?, type: TypeNote) {
        self.init()
        
        titleLabel.text = "\(durationMinute ?? 0) мин."
        self.type = type
        prepareMinute()
        prepareFrame()
    }
     
    var image: UIImage? {
        print("bounds",bounds)
        let view = UIView(frame: bounds)
        view.backgroundColor = .blue
        view.addSubview(self)
        print("superView", superview?.superview)
        print("superView", superview?.superview?.frame)
        //self.autoPinEdgesToSuperviewEdges()
   
        return self.asImage
    }
}

