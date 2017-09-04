//
//  RNSTransportTableViewCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSTransportTableViewCell: RNSBaseTableCell {
    @IBOutlet weak var dotsView: RNSDotsBussVertical!
    
    var item: RNSDotsVerticalModel? {
        didSet {
            dotsView.item = item
        }
    }
}
