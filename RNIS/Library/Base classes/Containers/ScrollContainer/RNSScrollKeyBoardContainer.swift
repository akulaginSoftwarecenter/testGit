//
//  RNSScrollContainer.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс скролл контейнера
 */
class RNSScrollKeyBoardContainer: UIViewController, KeyboardShowable, UIScrollViewDelegate {
    
    var viewBottomHeightLayoutConstraint: NSLayoutConstraint? {
        get {
            return bottomConstraint
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    var isNeedAddTap: Bool = true
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    static func initController(_ container: UIViewController?, isNeedAddTap: Bool = true) -> RNSScrollKeyBoardContainer? {
        let vc = RNSScrollKeyBoardContainer.initialControllerType()
        vc?.containerVC = container
        vc?.isNeedAddTap = isNeedAddTap
        return vc
    }
    
    @IBOutlet weak var coverView: UIView!
    var containerVC:UIViewController?
    
    /// Метод инициализации класса
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
    
    func prepareContentY(_ y: CGFloat) {
        var offset = scrollView.contentOffset
        offset.y = y
        scrollView.setContentOffset(offset, animated: true)
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
