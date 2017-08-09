//
//  RNSScrollShowContainer.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import SnapKit

class RNSScrollShowContainer: UIViewController, UIScrollViewDelegate {
    
    static func initController(_ container: UIViewController?) -> UIViewController? {
        let vc = RNSScrollShowContainer.initialController as? RNSScrollShowContainer
        vc?.containerVC = container
        return vc
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var coverView: UIView!
    
    var containerVC: UIViewController?
    
    var containerView: UIView? {
        return containerVC?.view
    }
    
    lazy var ranges: [RNSRangeScroll] = {
        return [self.rangeNav, self.rangeHalf, self.rangeThird, self.rangeBottom]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareContainer()
        prepareTouchView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollToStart()
    }
    
    func prepareContainer() {
        guard let containerVC = containerVC,
            let containerView = containerView else {
                return
        }
        self.addChildViewController(containerVC)
        coverView.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges()
    }
    
    func prepareTouchView() {
        guard let frame = containerView?.frame else {
            return
        }
        let rect = scrollView.convert(frame, to: STRouter.rootView)
        (view as? RNSTouchView)?.rect = CGRect(x: rect.origin.x, y: UIScreen.height + rect.origin.y, width: rect.width, height: rect.height)
    }
    
    override class var storyboardName: String {
        return "RNSScrollShowContainer"
    }
    
    func dismiss() {
       scrollToBottom()
       RNSMapManager.handlerDismissOldPresentVC?()
    }
}
