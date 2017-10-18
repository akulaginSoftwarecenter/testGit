//
//  RNSDateSelectView.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Date Select View
 */

class RNSDateSelectView: BaseViewWithXIBInit {
    
    var handlerDate: ((Date?) -> ())?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var oKButton: RNSBlackButton!
    @IBOutlet weak var cancelButton: RNSBlackButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        prepareUI()
    }
}
