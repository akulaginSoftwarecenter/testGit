//
//  RNSSearchTextCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSSearchCell: RNSBaseTableCell {
    @IBOutlet weak var imageBus: UIImageView!
    @IBOutlet weak var constraintLabel: NSLayoutConstraint!
    @IBOutlet weak var labelText: UILabel!
    
    var item: RNSTextItem? {
        didSet {
            prepareItem()
            prepareBisibleBus()
        }
    }
    
    func prepareItem() {
        labelText.text = item?.text
    }
    
    func prepareBisibleBus() {
        let visibleBus = (item as? RNSBusTemp) != nil
        constraintLabel.isActive = !visibleBus
        imageBus.isHidden = !visibleBus
    }
}
