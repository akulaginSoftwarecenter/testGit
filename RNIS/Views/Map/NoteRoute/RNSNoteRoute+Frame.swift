//
//  RNSNoteRoute+Frame.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSNoteRoute {
    
    func prepareFrame() {
        frame = CGRect(x: 0, y: 0, width: widthType, height: heightType)
        prepareBackView()
        prepareFrameTitle()
        prepareTriangle()
        prepareDistanceLabel()
    }
    
    func prepareBackView() {
        backView.frame = CGRect(x: xT, y: yT, width: widthText, height: backViewHeight)
        backView.layer.cornerRadius = 5
        backView.clipsToBounds = true
        backView.layer.masksToBounds = true
    }
    
    func prepareFrameTitle() {
        let rect = CGRect(x: 4, y: 5, width: widthText - 8, height: 18)
        titleLabel.frame = isHaveDistance ? rect : backView.bounds
        titleLabel.textAlignment = isHaveDistance ? .right : .center
    }
    
    func prepareDistanceLabel() {
        guard let distance = self.distance else {
            return
        }
        distanceLabel.frame = CGRect(x: 4, y: 23, width: widthText - 8, height: 12)
        distanceLabel.text = "\(Int(distance)) м."
        distanceLabel.isHidden = false
    }
   
    func prepareTriangle() {
        let halfHeight = (height - arrow)/2
        let halfWidth = (width - arrow)/2
        switch type {
        case .left:
            leftView.frame.origin = CGPoint(x: 0, y: halfHeight)
            leftView.isHidden = false
            break
        case .up:
            upView.frame.origin = CGPoint(x: halfWidth, y: 0)
            upView.isHidden = false
            break
        case .right:
            rightView.frame.origin = CGPoint(x: width - arrow, y: halfHeight)
            rightView.isHidden = false
            break
        case .down:
            downView.frame.origin = CGPoint(x: halfWidth, y: height - arrow)
            downView.isHidden = false
            break
        }
    }
}
