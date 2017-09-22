//
//  RNSDotsVerticalRun.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSDotsVerticalCell: RNSBaseTableCell {
    @IBOutlet weak var cirlce: UIView!

    @IBOutlet weak var runLine: RNSDotsWhiteVertical!
    @IBOutlet weak var busLine: UIView!

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelBus: UILabel!
    @IBOutlet weak var viewBus: UIView!
    
    var item: RNSVerticalTableItem? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        hiddenAll()
        guard let item = item else {
            return
        }
        if item.isEnd {
            cirlce.isHidden = false
            return
        }
        
        cirlce.isHidden = item.isBus
        runLine.isHidden = !item.isRun
        labelTitle.text = item.title
        labelBus.text = item.titleBus
        
        if item.isBus {
            labelBus.isHidden = false
            viewBus.isHidden = false
            busLine.isHidden = false
        }
    }
    
    func hiddenAll() {
        cirlce.isHidden = true
        runLine.isHidden = true
        busLine.isHidden = true
        labelBus.isHidden = true
        viewBus.isHidden = true
    }
}
