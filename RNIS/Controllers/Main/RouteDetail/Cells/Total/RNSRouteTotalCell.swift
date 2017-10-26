//
//  RNSRouteTotalCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/// Табличная ячейка элемента схемы маршрута, которая отображает общую продолжительность пути
class RNSRouteTotalCell: RNSRouteParentCell {

    /// Надпись продолжительности
    @IBOutlet weak var label: UILabel!
     
    override func prepareUI() {
        super.prepareUI()
        label.text = item?.text1
    }
}
