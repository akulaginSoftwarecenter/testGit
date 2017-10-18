//
//  ViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import PureLayout

/**
 RNSMapViewController
 */

class RNSMapViewController: UIViewController {
    
    @IBOutlet var showingButtonsConstraints: [NSLayoutConstraint]!
    @IBOutlet var hidingButtonsConstraints: [NSLayoutConstraint]!
//    @IBOutlet weak var stackView: UIStackView!
//    @IBOutlet weak var searchButton: UIButton!
    //
    var containerController: RNSMapParentController?
    var presentViewController: UIViewController?

    @IBOutlet weak var routeBtn: UIButton!
//    @IBOutlet weak var menuBtn: UIButton!
    /**
    route in RNSPostRouting com.rnis.geo.action.service.routing
     */
    var route: PGPolyline?
    private var animator: MapButtonsAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RNSMapManager.startLocation()
       // RNSMapManager.prepareStub()
        _ = RNSMapManager.shared.pinMyLocation
        prepareAnimator()
    }
    
    func prepareAnimator() {
        animator = MapButtonsAnimator(superview: view, duration: 0.3, usingSpringAnimation: false)
        animator.extraAnimationsWithVisibilityStateHidden = { [weak self] in
            self?.prepareAlpha($0 ? 0 : 1)
        }
    }
    
    func prepareAlpha(_ alpha: CGFloat) {
//        stackView.alpha = alpha
//        searchButton.alpha = alpha
        routeBtn.alpha = alpha
//        menuBtn.alpha = alpha
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RNSPageRouteManager.removeAllRoute()
        RNSPageRouteManager.items = nil
        prepareHandlers()
        animator.setMapButtons(hidden: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animator.setupOnce(showingButtonsConstraints, hidingButtonsConstraints, initialVisibilityStateHidden: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animator.setMapButtons(hidden: false, animated: true)
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }

    deinit {
        print("RNSMapViewController deinit")
    }
}

