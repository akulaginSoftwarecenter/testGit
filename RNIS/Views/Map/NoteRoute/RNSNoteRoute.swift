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
        self.backView.addSubview(label)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var distanceLabel: UILabel = {
        let label = UILabel()
        self.backView.addSubview(label)
        label.textAlignment = .right
        label.backgroundColor = .clear
        label.font = .cffazm12
        label.isHidden = true
        label.textColor = .AFAFAF
        return label
    }()
    
    lazy var backView: UIView = {
        let view = UIView()
        self.addSubview(view)
        return view
    }()
    
    var type: TypeNote = .left
    var distance: CLLocationDistance?
    
    let arrow = CGFloat(9)
    let textHeight = CGFloat(30)
    
    convenience init(busTitle: String?, type: TypeNote) {
        self.init(frame: CGRect.zero)
        
        titleLabel.text = busTitle
        self.type = type
        prepareUIBus()
        prepareFrame()
    }
    
    convenience init(durationMinute: Int?, distance: CLLocationDistance? = nil, type: TypeNote) {
        self.init(frame: CGRect.zero)
        titleLabel.text = "\(durationMinute ?? 0) мин."
        self.type = type
        self.distance = distance
        prepareMinute()
        prepareFrame()
    }
}

