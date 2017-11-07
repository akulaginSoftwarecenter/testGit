//
//  RNSScrollShowContainer.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import SnapKit

class RNSScrollShowContainer: UIViewController {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    static func initController(_ container: UIViewController?, topTitle: String? = nil) -> RNSScrollShowContainer? {
        let vc = RNSScrollShowContainer.initialController as? RNSScrollShowContainer
        vc?.containerVC = container
        vc?.topTitle = topTitle
        return vc
    }
    
    @IBOutlet weak var heightButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var coverBotton: UIButton!
    @IBOutlet weak var imageSlide: UIImageView!
    
    var containerVC: UIViewController?
    var containerView: UIView? {
        return containerVC?.view
    }
    
    var startBottomOffset: CGFloat = 175
    var contentInsetBottom: CGFloat = 0
    var heightCoverButtonTop: CGFloat = 64
    var heightTopView: CGFloat = 64
    
    var startOverTopDeselerate: Bool = false
    var topTitle: String?
    var hideImageSlide = false
    var hideCoverBotton = false
    var allowHideBottom = true
    var completeFirstAnimation = false
    
    var handlerRect: AliasRectBlock?
    var handlerDismiss: EmptyBlock?
    var handlerShowStartComplete: EmptyBlock?
    
    lazy var ranges: [RNSRangeScroll] = {
        return [self.rangeNav, self.rangeHalf, self.rangeThird, self.rangeBottom]
    }()
    
    lazy var rangesSwipe: [RNSRangeScroll] = {
        return [self.rangeHalfTop, self.rangeHalfBottom]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollToStart()
    }
    
    override class var storyboardName: String {
        return "RNSScrollShowContainer"
    }
    
    func dismiss() {
        guard allowHideBottom else {
            scrollToStart()
            return
        }
        scrollToBottom()
        handlerDismiss?()
    }
}
