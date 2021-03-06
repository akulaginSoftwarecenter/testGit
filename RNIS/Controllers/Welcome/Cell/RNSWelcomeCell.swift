//
//  RNSWelcomeCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
/**
 Класс ячейки приветствия
 */
class RNSWelcomeCell: UICollectionViewCell {
    
    let endConstraint = CGFloat(54)
    
    @IBOutlet weak var imageMoc: UIImageView!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageStart: UIImageView!
    @IBOutlet weak var imageBack: UIImageView!
    
    /// главная переменная инициализации
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
    
    func prepareAnimation() {
        imageMoc.alpha = 0
    }
    
    func startAnimate() {
        guard topConstraint.constant != endConstraint else {
            return
        }
        topConstaintStart()
        animateConstrains {
            self.topConstraint.constant = self.endConstraint
            self.imageMoc.alpha = 1
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
