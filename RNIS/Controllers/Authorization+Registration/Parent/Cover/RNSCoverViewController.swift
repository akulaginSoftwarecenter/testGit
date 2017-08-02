//
//  RNSCoverViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSCoverViewController: UIViewController {
    
    @IBOutlet var coverView: RNSLoginView!
    var handlerBlackAction: EmptyBlock?
    var titleTextTop: TypeTitle?
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCoverView()
    }
    
    func prepareCoverView() {
        prepareTitleTextTop()
        coverView.handlerBlackAction = { [weak self] in
            self?.loginPressed()
        }
    }
    
    func prepareTitleTextTop() {
        guard let titleTextTop = titleTextTop else {
            return
        }
        coverView.titleTextTop = titleTextTop.rawValue
    }
    
    func loginPressed() {
        
    }
}
