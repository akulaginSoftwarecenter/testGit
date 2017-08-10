//
//  RNSCircleHole.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSCircleHole: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareUI()
    }
    
    func prepareUI() {
        backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        prepareCircle()
    }
}
