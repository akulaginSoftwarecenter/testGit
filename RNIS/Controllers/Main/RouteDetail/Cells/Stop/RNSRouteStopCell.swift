//
//  RNSRouteStopCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteStopCell: RNSBaseTableCell {

    @IBOutlet weak var text1Label: UILabel!
    @IBOutlet weak var text2Label: UILabel!
    @IBOutlet weak var edgeCircle: RNSCircle!
    
    var item: RNSRouteTableItem? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        text1Label.text = item?.text1
        text2Label.text = item?.text2
        edgeCircle.isHidden = item?.edge ?? true
    }
}
