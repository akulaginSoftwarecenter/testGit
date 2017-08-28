//
//  RNSNoteRoute.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSNoteRoute: UIView {
    
    lazy var leftView: RNSTriangle = {
        let view = RNSTriangle( .left)
        self.addSubview(view)
        return view
    }()
    
    lazy var upView: RNSTriangle = {
        let view = RNSTriangle( .up)
        self.addSubview(view)
        return view
    }()
    
    lazy var rightView: RNSTriangle = {
        let view = RNSTriangle( .right)
        self.addSubview(view)
        return view
    }()
    
    lazy var downView: RNSTriangle = {
        let view = RNSTriangle( .down)
        self.addSubview(view)
        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        self.addSubview(label)
        label.textAlignment = .center
        
        return label
    }()
    
    var type: TypeNote = .left
    
    let arrow = CGFloat(9)
    let textHeight = CGFloat(30)
    
    convenience init(busTitle: String?, type: TypeNote) {
        self.init(frame: CGRect.zero)
        
        titleLabel.text = busTitle
        self.type = type
        prepareUIBus()
        prepareFrame()
    }
    
    convenience init(durationMinute: Int?, type: TypeNote) {
        self.init(frame: CGRect.zero)
        
        titleLabel.text = "\(durationMinute ?? 0) мин."
        self.type = type
        prepareMinute()
        prepareFrame()
    }
}

