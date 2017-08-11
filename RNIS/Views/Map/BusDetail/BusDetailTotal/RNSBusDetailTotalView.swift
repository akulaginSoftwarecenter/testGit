//
//  RNSBusDetailTotalView.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBusDetailTotalView: BaseViewWithXIBInit {
    
    var item: RNSBus?{
        didSet{
            updateUI()
        }
    }
    
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var driverLabel: UILabel!
    @IBOutlet weak var сonductorLabel: UILabel!

    
    func updateUI() {
        let stops = item?.busStops
        startLabel.text = stops?.first?.title
        currentLabel.text = item?.currentBusStops?.title
        endLabel.text = stops?.last?.title
        
        driverLabel.text = item?.driver
        сonductorLabel.text = item?.conductor
    }

    @IBAction func actionButton(_ sender: Any) {
        RNSBusInfoViewController.initController(item)?.pushAnimatedRedScroll()
    }
}
