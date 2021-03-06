//
//  RNSRouteStillCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
/**
 ячейка отображения "Еще" маршрута
 */
class RNSRouteStillCell: RNSRouteParentCell {

    /// UILabel для отображения заголовка
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageArrow: UIImageView!
    @IBOutlet weak var line: UIView!
    
    @IBOutlet weak var topLine: UIView!
    
    @IBOutlet var circles: [RNSCircle]!
    @IBOutlet weak var arrowRight: UIImageView!
    
    var openStill: Bool {
        return item?.openStill ?? false
    }
    
    override func prepareUI() {
        super.prepareUI()
        
        line.roundTopCorners()
        topLine.roundBottomCorners()
        label.text = item?.stillText
        imageArrow.image = openStill ? #imageLiteral(resourceName: "ArrowUp") : #imageLiteral(resourceName: "ArrowDown")
        updateCircles()
    }
    
    func updateCircles() {
        if showMove, doneMove {
            return
        }
        let color: UIColor = openStill ? .white : .FFB9AF
        for view in circles {
            view.backgroundColor = color
        }
    }
    
    var itemsStill: [RNSRouteTableItem]? {
        return item?.itemsStill
    }

    var lastDoneMove: Bool {
        return itemsStill?.last?.doneMove ?? false
    }
   
    override func prepareDone() {
        let color: UIColor = doneMove ? doneColor : .white
        topLine.backgroundColor = color
        for view in circles {
            view.backgroundColor = color
        }
        
        prepareLineDone()
        
        arrowRight.isHidden = !(item?.showArrow ?? false)
    }
    
    func prepareLineDone() {
        var color = UIColor.white
        if (openStill && doneMove) || (!openStill && lastDoneMove) {
            color = doneColor
        }
        line.backgroundColor = color
    }
}
