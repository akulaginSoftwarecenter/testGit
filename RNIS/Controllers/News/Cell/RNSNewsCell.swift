//
//  RNSNewsCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSNewsCell: RNSBaseTableCell {

    @IBOutlet weak var label: UILabel!
    
    var item: RNSNewsTemp? {
        didSet{
            updateItem()
        }
    }
    
    func updateItem() {
        label?.text = item?.titleDate
    }
}

