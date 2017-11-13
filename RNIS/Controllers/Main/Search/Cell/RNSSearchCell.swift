//
//  RNSSearchTextCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/// Табличная ячейка для отображения результатов поиска на карте
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
        var text = item?.name
        if let item = item as? RNSBusStopTemp,
            let nameDistance = item.nameDistance {
            text = nameDistance
        }
        labelText.text = text
    }
    
    func prepareBisibleBus() {
        let visibleBus = (item as? RNSBusTemp) != nil
        constraintLabel.isActive = !visibleBus
        imageBus.isHidden = !visibleBus
    }
}
