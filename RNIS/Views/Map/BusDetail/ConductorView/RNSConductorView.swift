//
//  RNSConductorView.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSConductorView: BaseViewWithXIBInit {
    
    var item: RNSBusTemp?
    
    @IBOutlet weak var driverLabel: UILabel!
    @IBOutlet weak var сonductorLabel: UILabel!
    
    convenience init(_ item: RNSBusTemp?) {
        self.init(frame: CGRect.null)
        self.item = item
        updateUI()
    }
    
    func updateUI() {
        driverLabel.text = item?.driver
        сonductorLabel.text = item?.check_taker
    }
    
    @IBAction func actionButton(_ sender: Any) {
        RNSBusInfoViewController.initController(item)?.pushAnimatedRedScroll()
    }
}
