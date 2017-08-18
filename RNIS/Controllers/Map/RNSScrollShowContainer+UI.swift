//
//  RNSScrollShowContainer+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSScrollShowContainer {
    
    func prepareUI() {
        prepareContainer()
        prepareTouchView()
        prepareTitle()
        prepareButtonTop()
        prepareScrollView()
    }
    
    func prepareButtonTop() {
        heightButtonTopConstraint.constant = heightCoverButtonTop
    }
    
    func prepareTitle() {
        topTitleLabel.text = topTitle
    }
    
    func prepareContainer() {
        guard let containerVC = containerVC,
            let containerView = containerView else {
                return
        }
        self.addChildViewController(containerVC)
        coverView.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges()
    }
   
    func prepareTouchView() {
        guard let frame = containerView?.frame else {
            return
        }
        var rect = scrollView.convert(frame, to: STRouter.rootView)
        rect = CGRect(x: rect.origin.x, y: UIScreen.height + rect.origin.y, width: rect.width, height: rect.height)
        handlerRect?(rect)
        prepareCoverBotton(rect)
        (view as? RNSTouchView)?.rect = rect
    }
    
    func updatePositionTop() {
        let height = CGFloat(64)
        var value  = offsetY - topOffset + height
        if value > height {
            value = height
        }
        topConstraint.constant = value
    }
    
    func prepareCoverBotton(_ rect: CGRect) {
        coverBotton.isEnabled = rect.origin.y > halfOffset
    }
}
