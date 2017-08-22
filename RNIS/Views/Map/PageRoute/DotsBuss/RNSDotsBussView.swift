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
    
    var item: RNSRouteVariant? {
        didSet {
            reloadData()
        }
    }
    
    func reloadData() {
        print("widthArraw",widthArraw)
        let widthArrow = self.widthArraw
        constraintSmallDots.constant = widthArrow
        
        stackViewRemoveSubViews()
        
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
    
    func stackViewRemoveSubViews() {
        for view in stackView.arrangedSubviews {
            stackView.removeArrangedSubview(view)
        }
    }
    
    var widthArraw: CGFloat {
        let edge = CGFloat(66)
        let countBuss = CGFloat(item?.buss?.count ?? 0)
        let betweens = CGFloat(5 * ((countBuss + 1) * 2))
        let titleWidthBuss = item?.titleWidthBuss ?? 0
        print("countBuss",countBuss)
        print("betweens",betweens)
        print("titleWidthBuss",titleWidthBuss)
        print("UIScreen.width",UIScreen.width)
        return (UIScreen.width - edge - betweens - titleWidthBuss)/(countBuss + 1)
    }
}
