//
//  RNSWelcomeCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSWelcomeCell: UICollectionViewCell {
    
    let endConstraint = CGFloat(54)
    
    @IBOutlet weak var imageMoc: UIImageView!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageStart: UIImageView!
    @IBOutlet weak var imageBack: UIImageView!
    
    var item: WelcomeItem? {
        didSet {
            updateItem()
        }
    }
    
    func updateItem() {
        guard let item = item else {
            return
        }
        imageStart.image = item.startImage
        imageBack.image = item.back
        imageMoc.image = item.main
    }
    
    func startAnimate() {
        guard topConstraint.constant != endConstraint else {
            return
        }
        topConstaintStart()
        animateConstrains {
            self.topConstraint.constant = self.endConstraint
        }
    }
    
    func endAnimate() {
        animateConstrains {
            self.topConstaintStart()
        }
    }
    
    func animateConstrains(handler: EmptyBlock?) {
        UIView.animateConstrains(contentView) {
            handler?()
        }
    }
    
    func topConstaintStart() {
        topConstraint.constant = 74
    }
}
