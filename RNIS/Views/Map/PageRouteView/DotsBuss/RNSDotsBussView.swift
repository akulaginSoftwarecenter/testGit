//
//  RNSDotsBussView.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Представление показывает схему движения автобуса
 */
class RNSDotsBussView: BaseViewWithXIBInit {
    
    @IBOutlet weak var constraintSmallDots: NSLayoutConstraint!

    @IBOutlet weak var firstCircleWidth: NSLayoutConstraint!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var firstCircle: RNSCircleHoleWhite!
    @IBOutlet weak var lastCircle: RNSCircleHoleWhite!
    @IBOutlet weak var dotsWhite: RNSDotsWhiteHorizontal!
    
    /// главная переменная инициализации варианта маршрута
    var item: RNSRouteVariant? {
        didSet {
            reloadData()
        }
    }
    
    var buss = [RNSBusRouteTemp]()
    var bussShowMove = [RNSBusRouteTemp]()
    
    var showMove = false
    
    var widthArraw: CGFloat = 0
    
    func reloadData() {
        prepareValues()
        prepareMoveFirstEndIfNeed()
        prepareFirstSegment()
        
        drawBuss()
    }
    
    func drawBuss() {
        stackView.removeArrangedSubviews()
        for bus in bussShowMove {
            let name = RNSDotsName(bus)
            stackView.addArrangedSubview(name)
            let doneMove = showMove ? bus.doneMove : false
            let arrow = RNSArrowLeft(doneMove)
            arrow.snp.makeConstraints({ (make) in
                make.width.equalTo(widthArraw)
            })
            stackView.addArrangedSubview(arrow)
        }
    }
}
