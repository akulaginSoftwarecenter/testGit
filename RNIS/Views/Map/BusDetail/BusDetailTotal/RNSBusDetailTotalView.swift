//
//  RNSBusDetailTotalView.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Bus Detail Total View
 */

class RNSBusDetailTotalView: BaseViewWithXIBInit {
    
    var item: RNSBusTemp?{
        didSet{
            updateUI()
        }
    }
    
    @IBOutlet weak var conditioningImage: UIImageView!
    @IBOutlet weak var paymentImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    
    func updateUI() {
        titleLabel.text =  item?.route_number
        let stops = item?.stop_points
        startLabel.text = stops?.first?.name
        currentLabel.text = item?.next_stop_point?.name
        endLabel.text = stops?.last?.name
        
        conditioningImage.isHidden = !(item?.has_air_conditioning ?? false)
        paymentImage.isHidden = !(item?.has_cashless_payment ?? false)
    }
}
