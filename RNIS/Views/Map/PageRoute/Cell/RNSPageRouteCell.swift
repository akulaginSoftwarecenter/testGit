//
//  RNSPageRouteCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPageRouteCell: UICollectionViewCell {
    
    @IBOutlet weak var labelDurations: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var dotsBussView: RNSDotsBussView!
    
    var item: RNSRouteVariant? {
        didSet {
            reloadData()
        }
    }
    
    func reloadData() {
        dotsBussView.item = item
        prepareDuration()
        prepareTime()
        prepareCount()
    }
    
    func prepareDuration() {
        guard let duration = item?.durationMinute else {
            return
        }
        labelDurations.text = "\(duration)"
    }
    
    func prepareTime() {
        guard let endDate = item?.endDate else {
            return
        }
        labelTime.text = endDate.stringHHmm
    }
    
    func prepareCount() {
        guard let count = item?.buss.count else {
            return
        }
        var padeg: String
        if count == 1 {
            padeg = "пересадка"
        } else if (1...4).contains(count) {
            padeg = "пересадки"
        } else {
            padeg = "пересадок"
        }
        
        labelCount.text = "\(count) " + padeg
    }
}
