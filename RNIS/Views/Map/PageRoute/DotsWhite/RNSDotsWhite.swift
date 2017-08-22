//
//  RNSDotsWhite.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSDotsWhite: BaseViewWithXIBInit {

    @IBOutlet weak var stackView: UIStackView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let count = Int(frame.width/9)
        stackView.removeArrangedSubviews()
        for _ in (0...count) {
            stackView.addArrangedSubview(circle)
        }
   }
    
    var circle: UIView {
        let circle = RNSCircle()
        circle.snp.makeConstraints { (make) in
            make.size.equalTo(6)
        }
        circle.backgroundColor = .white
        return circle
    }
}
