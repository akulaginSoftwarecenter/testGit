//
//  RNSAddressCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 RNSAddressCell
 */

class RNSAddressCell: RNSBaseTableCell {
    
    var item: String? {
        didSet{
            titleLabel?.text = item
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
}
