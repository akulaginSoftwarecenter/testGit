//
//  RNSAlertViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSAlertViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    init(_ message: String?) {
        super.init(nibName: nil, bundle: nil)
        
        messageLabel.text = message
        modalPresentationStyle = .overCurrentContext
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
