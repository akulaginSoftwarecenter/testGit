//
//  RNSForecastCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSForecastCell: RNSBaseTableCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeView: UIView!
    
    var item: RNSRouteBusTemp? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        numberLabel.text = item?.route_number ?? ""
        
        hiddenAll()
        if let time = item?.time {
            timeView.isHidden  = false
            timeLabel.text = "\(time) мин."
        } else {
            periodLabel.isHidden = false
            periodLabel.text = "Каждые \(item?.timePerod ?? 0) мин."
        }
    }
    
    func hiddenAll() {
        periodLabel.isHidden = true
        timeView.isHidden = true
    }
}
