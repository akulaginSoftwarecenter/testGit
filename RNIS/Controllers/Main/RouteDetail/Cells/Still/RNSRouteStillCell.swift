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
    
    @IBOutlet weak var topLine: UIView!
    
    @IBOutlet var circles: [RNSCircle]!
    
    var openStill: Bool {
        return item?.openStill ?? false
    }
    
    override func prepareUI() {
        line.roundTopCorners()
        topLine.roundBottomCorners()
        label.text = item?.stillText
        imageArrow.image = openStill ? #imageLiteral(resourceName: "ArrowUp") : #imageLiteral(resourceName: "ArrowDown")
        updateCircles()
    }
    
    func updateCircles() {
        let color: UIColor = openStill ? .white : .FFB9AF
        for view in circles {
            view.backgroundColor = color
        }
    }
}
