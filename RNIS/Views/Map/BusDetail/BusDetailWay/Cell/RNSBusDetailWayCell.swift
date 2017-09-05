//
//  RNSBusDetailWayCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

enum STTypeItemArray {
    case start, normal, end
}

class RNSBusDetailWayCell: RNSBaseTableCell {
    
    var typeItem: STTypeItemArray = .normal {
        didSet {
            prepareType()
        }
    }
    
    var item: RNSBusStopTemp? {
        didSet{
            prepareUI()
        }
    }
    
    @IBOutlet weak var circleHole: RNSCircleHole!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageDots: UIImageView!
    
    func prepareUI() {
        titleLabel.text = item?.name
    }
    
    func prepareType() {
        imageDots.isHidden = typeItem == .end
        circleHole.isHidden = typeItem == .normal
    }
}
