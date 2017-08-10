//
//  RNSBusStopDetailCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBusStopDetailCell: RNSBaseTableCell {
    
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var numCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var nextLabel: UILabel!
    
    var item: RNSBus? {
        didSet {
            prepareUI()
        }
    }
    
    func prepareUI() {
        minuteLabel.text = String(item?.minute ?? 0) + " мин."
        numLabel.text = String(item?.num ?? 0)
        
        prepareShowNext()
    }
    
    func prepareShowNext() {
        let showNext = item?.showNext ?? false
        nextLabel.isHidden = !showNext
        numCenterConstraint.constant = showNext ? -6 : 0
    }
}