//
//  RNSDotsWhite.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSDotsWhiteHorizontal: BaseViewWithXIBInit {
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!

    @IBOutlet weak var stackView: UIStackView!
    
    var sizeCircle: CGFloat {
        return 6
    }
    
    var axis : UILayoutConstraintAxis {
        return .horizontal
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        stackView.axis = axis
           
        let count = Int(length/(sizeCircle + 3))
        stackView.removeArrangedSubviews()
        for _ in (0...count) {
            stackView.addArrangedSubview(circle)
        }
    }
    
    func prepareVertical() {
        if axis == .vertical {
            leadingConstraint.isActive = true
            trailingConstraint.isActive = true
        }
    }
    
    var isVertical: Bool {
        return axis == .vertical
    }
    
    var length: CGFloat {
        return isVertical ? frame.height : frame.width
    }
    
    var circle: UIView {
        let circle = RNSCircle()
        circle.snp.makeConstraints { (make) in
            make.size.equalTo(sizeCircle)
        }
        circle.backgroundColor = .white
        return circle
    }
    
    override var nibNamed:String {
        return String(describing: RNSDotsWhiteHorizontal.self)
    }
}
