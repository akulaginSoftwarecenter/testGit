//
//  RNSRouteStillCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteStillCell: RNSRouteParentCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageArrow: UIImageView!
    @IBOutlet weak var line: UIView!
    
    override func prepareUI() {
        line.roundTopCorners()
        label.text = item?.stillText
        imageArrow.image = (item?.openStill ?? false) ? #imageLiteral(resourceName: "ArrowUp") : #imageLiteral(resourceName: "ArrowDown")
    }

}
