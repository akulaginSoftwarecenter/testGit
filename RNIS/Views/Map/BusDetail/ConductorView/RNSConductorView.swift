//
//  RNSConductorView.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Conductor View
 */

class RNSConductorView: BaseViewWithXIBInit {
    
    var item: RNSBusTemp? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var driverLabel: UILabel!
    @IBOutlet weak var сonductorLabel: UILabel!
    
    func updateUI() {
        driverLabel.text = "Водитель: " + (item?.driver ?? "")
        сonductorLabel.text = "Кондуктор: " + (item?.check_taker ?? "")
    }
    
    @IBAction func actionButton(_ sender: Any) {
        RNSBusInfoViewController.initController(item)?.pushAnimatedRedScroll()
    }
}
