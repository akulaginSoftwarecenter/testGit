//
//  RNSRouteStopCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteStopCell: RNSRouteParentCell {

    @IBOutlet weak var arrowLabel: RNSTriangle!
    @IBOutlet weak var text1Label: UILabel!
    @IBOutlet weak var text2Label: UILabel!
    @IBOutlet weak var edgeCircle: RNSCircle!
    
    @IBOutlet weak var busLine: UIView!
    @IBOutlet weak var busConstraint: NSLayoutConstraint!
    @IBOutlet weak var runLine: RNSDotsWhiteVertical!
    @IBOutlet weak var topBusLine: UIView!
    
    @IBOutlet weak var circleView: RNSCircle!
    
    override func prepareUI() {
        super.prepareUI()
        text1Label.text = item?.text1
        text2Label.text = item?.text2
        edgeCircle.isHidden = !(item?.edge ?? true)
        
        prepareTypeRoute()
    }
    
    func prepareTypeRoute() {
        hiddenLine()
        guard let item = item, item.showLine else {
            return
        }
        let isBus = item.isBus
        busLine.isHidden = !isBus
        runLine.isHidden = isBus
        topBusLine.isHidden = !item.showTopBusLine
        busConstraint.constant = item.shortLine ? 0 : -7
    }
    
    func hiddenLine() {
        topBusLine.isHidden = true
        busLine.isHidden = true
        runLine.isHidden = true
    }
    
    override func prepareDone() {
          
        let color: UIColor = doneMove ? doneColor : .white
        
        runLine.colorCircle = color
        busLine.backgroundColor = color
        circleView.backgroundColor = doneMove ? doneColor : .FFB9AF
        
        text1Label.isHidden = doneMove
        arrowLabel.isHidden = doneMove
             
        topBusLine.backgroundColor = (item?.previousDoneMove ?? false) ? doneColor : .white
    }
}
