//
//  RNSDotsBussView.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSDotsBussView: BaseViewWithXIBInit {
    
    @IBOutlet weak var constraintSmallDots: NSLayoutConstraint!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var firstCircle: RNSCircleHoleWhite!
    @IBOutlet weak var lastCircle: RNSCircleHoleWhite!
    @IBOutlet weak var dotsWhite: RNSDotsWhiteHorizontal!
    
    var item: RNSRouteVariant? {
        didSet {
            reloadData()
        }
    }
    
    func reloadData() {
        prepareColorFirst()
        let widthArrow = self.widthArraw
        constraintSmallDots.constant = widthArrow
        stackView.removeArrangedSubviews()
        
        for bus in item?.buss ?? [] {
            let name = RNSDotsName(bus)
            stackView.addArrangedSubview(name)
            
            let arrow = RNSArrowLeft()
            arrow.snp.makeConstraints({ (make) in
                make.width.equalTo(widthArrow)
            })
            stackView.addArrangedSubview(arrow)
        }
    }
    
    var widthArraw: CGFloat {
        let edge = CGFloat(66)
        let countBuss = CGFloat(item?.buss.count ?? 0)
        let betweens = CGFloat(3 * ((countBuss + 1) * 2))
        let titleWidthBuss = item?.titleWidthBuss ?? 0
        return (UIScreen.width - edge - betweens - titleWidthBuss)/(countBuss + 1)
    }
    
    func prepareColorFirst() {
        if item?.points.first?.doneMove ?? false {
            firstCircle.prepareDone()
            dotsWhite.prepareDone()
        }
    }
}
