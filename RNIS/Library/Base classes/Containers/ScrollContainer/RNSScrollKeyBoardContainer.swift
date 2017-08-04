//
//  RNSScrollContainer.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSScrollKeyBoardContainer: UIViewController, KeyboardShowable {
    
    var viewBottomHeightLayoutConstraint: NSLayoutConstraint? {
        get {
            return bottomConstraint
        }
    }
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    static func initController(_ container: UIViewController?) -> UIViewController? {
        let vc = RNSScrollKeyBoardContainer.initialController as? RNSScrollKeyBoardContainer
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
        coverView.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges()
    }
    
    override class var storyboardName: String {
        return "RNSScrollKeyBoardContainer"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeAllObservers()
    }
}
