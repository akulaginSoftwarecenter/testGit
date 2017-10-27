//
//  RNSRouteStopCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/// Табличная ячейка автобусной остановки на схеме маршрута
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
        prepareTopBusLine()
        guard let item = item,
            item.showLine else {
            return
        }
        let isBusLine = item.isBusLine
        busLine.isHidden = !isBusLine
        runLine.isHidden = isBusLine
        busConstraint.constant = item.shortLine ? 0 : -7
    }
    
    func prepareTopBusLine() {
        topBusLine.isHidden = !(item?.showTopBusLine ?? false)
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
             
        topBusLine.backgroundColor = (item?.previousDoneMove ?? false) ? doneColor : .white
    }
}
