//
//  RNSBusStopDetailCell.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBusStopDetailCell: RNSBaseTableCell {
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var alertButton: UIButton!
    
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var numCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var nextLabel: UILabel!
    
    var updateFavorite: EmptyBlock?
    
    var item: RNSBusRouteTemp? {
        didSet {
            prepareUI()
        }
    }
    
    func prepareUI() {
        prepareFavorites()
        prepareTime()
        numLabel.text = item?.number
        prepareShowNext()
        prepareAlert()
    }
    
    func prepareTime() {
        if let time = item?.time {
            minuteLabel.text = "\(time) мин."
        }
    }
    
    func prepareAlert() {
        let in_notifications = item?.in_notifications ?? false
        alertButton.setImage(in_notifications ? #imageLiteral(resourceName: "bellFill"): #imageLiteral(resourceName: "bell"), for: UIControlState())
    }
    
    func prepareFavorites() {
        let in_favorites = item?.in_favorites ?? false
        favoriteButton.setImage(in_favorites ?#imageLiteral(resourceName: "flagFill2") : #imageLiteral(resourceName: "flag"), for: UIControlState())
    }
    
    func prepareShowNext() {
        let showNext = item?.next ?? false
        nextLabel.isHidden = !showNext
        numCenterConstraint.constant = showNext ? -6 : 0
    }
}
