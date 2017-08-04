//
//  RNSScrollContainer.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSScrollContainer: UIViewController {

    static func initController(_ container: UIViewController?) -> UIViewController? {
        let vc = RNSScrollContainer.initialController as? RNSScrollContainer
        vc?.containerVC = container
        return vc
    }
    
    @IBOutlet weak var coverView: UIView!
    var containerVC:UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareContainer()
    }
    
    func prepareContainer() {
        guard let containerVC = containerVC,
            let containerView = containerVC.view else {
                return
        }
        self.addChildViewController(containerVC)
        print("coverView",coverView)
        coverView.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges()
    }
    
    override class var storyboardName: String {
        return "RNSScrollContainer"
    }
}
