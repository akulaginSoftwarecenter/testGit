//
//  STImageContainer.swift
//  Spytricks
//
//  Created by Артем Кулагин on 10.04.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit
import SnapKit

class STImageContainer: UIViewController {
    
    var containerVC:UIViewController?
    
    convenience init(_ container: UIViewController?) {
        self.init()
        containerVC = container
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addBackGroundImage()
        prepareContainer()
    }
    
    func prepareContainer() {
        guard let containerVC = containerVC,
            let containerView = containerVC.view else {
                return
        }
        self.addChildViewController(containerVC)
        view.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges()
    }
}
