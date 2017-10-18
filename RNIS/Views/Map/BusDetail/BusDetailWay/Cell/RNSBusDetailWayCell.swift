//
//  RNSBusDetailWayCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Bus Detail Way Cell
 */

enum STTypeItemArray {
    case start, normal, end
}

class RNSBusDetailWayCell: RNSBaseTableCell {
    
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var bottomLine: UIView!
    
    @IBOutlet var dots: [RNSCircle]!
    
    @IBOutlet weak var dotsLine: UIView!
    
    @IBOutlet weak var circle: RNSCircle!
    @IBOutlet weak var circleCenter: RNSCircle!
    @IBOutlet weak var widthCircle: NSLayoutConstraint!
    
    @IBOutlet weak var whiteTopLine: UIView!
    @IBOutlet weak var whiteDownLine: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    
    @IBOutlet weak var separatorLine: UIView!
    @IBOutlet weak var currentImage: UIImageView!
    
    var item: RNSBusTableItem? {
        didSet{
            prepareUI()
        }
    }
    
    func prepareUI() {
        defaultAll()
        prepareCorners()
        prepareCircles()
        prepareTitle()
        prepareArrows()
        prepareLines()
    }
    
    func prepareCircles() {
        widthCircle.constant = isCurrent ? 23 : 18
        circleCenter.isHidden = !isEdge
        circle.isHidden = isStill
        circle.backgroundColor = isCurrent ? .white : .FFB9AF
        
        for view in dots {
            view.backgroundColor = isOpenStill ? .white : .FFB9AF
        }
    }
    
    func prepareTitle() {
        titleLabel.text = item?.titleTemp
        titleLabel.textColor = isStill ? .FFB9AF : .white
    }
    
    func prepareCorners() {
        topLine.roundBottomCorners()
        bottomLine.roundTopCorners()
    }
    
    func prepareLines() {
        dotsLine.isHidden = !isStill
        
        if isStill {
            topLine.isHidden = isStart
        } else {
            whiteTopLine.isHidden = isStart
            whiteDownLine.isHidden = isEnd
        }
    }
    
    func prepareArrows() {
        currentImage.isHidden = !isCurrent
        arrowImage.isHidden = !isStill
        arrowImage.image = (item?.openStill ?? false) ? #imageLiteral(resourceName: "ArrowUp") : #imageLiteral(resourceName: "ArrowDownPink")
    }
    
    func defaultAll() {
        topLine.isHidden = false
        bottomLine.isHidden = false
        
        dotsLine.isHidden = true
        whiteTopLine.isHidden = true
        whiteDownLine.isHidden = true
        circle.isHidden = true
        circleCenter.isHidden = true
        arrowImage.isHidden = true
    }
}
