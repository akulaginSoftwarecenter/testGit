//
//  RNSRouteBusCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteBusCell: RNSBaseTableCell {

    @IBOutlet weak var label: UILabel!
    
    var item: RNSRouteTableItem? {
        didSet {
            label.text = item?.text1
        }
    }
}
