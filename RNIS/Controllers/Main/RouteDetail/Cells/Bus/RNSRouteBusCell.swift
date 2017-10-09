//
//  RNSRouteBusCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteBusCell: RNSRouteParentCell {

    @IBOutlet weak var line: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func prepareUI() {
        super.prepareUI()
        label.text = item?.text1
        line.roundBottomCorners()
    }
    
    override func prepareDone() {
        line.backgroundColor = doneMove ? .A3423C : .white
    }
}
