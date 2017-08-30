//
//  RNSRouteStopCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteStopCell: RNSRouteParentCell {

    @IBOutlet weak var text1Label: UILabel!
    @IBOutlet weak var text2Label: UILabel!
    @IBOutlet weak var edgeCircle: RNSCircle!
    
    @IBOutlet weak var busLine: UIView!
    @IBOutlet weak var busConstraint: NSLayoutConstraint!
    @IBOutlet weak var runLine: RNSDotsWhiteVertical!
    
    override func prepareUI() {
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
        busConstraint.constant = item.shortLine ? 0 : -7
    }
    
    func hiddenLine() {
        busLine.isHidden = true
        runLine.isHidden = true
    }
}
