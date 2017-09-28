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
    
    var item: RNSForecastBus? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        numberLabel.text = String(item?.route_number ?? 0)
        
        hiddenAll()
        if let time = item?.time {
            timeView.isHidden  = false
            timeLabel.text = "\(time ?? 0) мин."
        } else {
           // periodLabel.isHidden = false
           // periodLabel.text = "Каждые \(item?.timePerod ?? 0) мин."
        }
    }
    
    func hiddenAll() {
        periodLabel.isHidden = true
        timeView.isHidden = true
    }
}
