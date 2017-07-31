//
//  RNSPhoneViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPhoneViewController: UIViewController {

    @IBOutlet var coverView: RNSLoginView!

    var handlerBlackAction: EmptyBlock?
    
    @IBInspectable var titleTextTop: String {
        get { return "" }
        set {
            self.coverView.titleTextTop = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCoverView()
    }
    
    func prepareCoverView() {
        coverView.handlerBlackAction = { [weak self] in
            self?.handlerBlackAction?()
        }
    }
    
    override class var storyboardName: String {
        return "RNSPhoneViewController"
    }
}
