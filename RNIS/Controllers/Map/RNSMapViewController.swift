//
//  ViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import PureLayout

class RNSMapViewController: UIViewController {
    
    @IBOutlet var showingButtonsConstraints: [NSLayoutConstraint]!
    @IBOutlet var hidingButtonsConstraints: [NSLayoutConstraint]!
    @IBOutlet var showingButtonsConstraints2: [NSLayoutConstraint]!
    @IBOutlet var hidingButtonsConstraints2: [NSLayoutConstraint]!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var searchButton: UIButton!
    //
    var containerController: RNSMapParentController?
    var presentViewController: UIViewController?
    
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
        //animator = MapButtonsAnimator(superview: view, duration: 0.7, usingSpringAnimation: true)
        animator = MapButtonsAnimator(superview: view, duration: 0.3, usingSpringAnimation: false)
        animator.extraAnimationsWithVisibilityStateHidden = { [weak self] in
            self?.stackView.alpha = $0 ? 0 : 1
            self?.searchButton.alpha = $0 ? 0 : 1
        }
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
        //animator.setupOnce(showingButtonsConstraints, hidingButtonsConstraints, initialVisibilityStateHidden: true)
        animator.setupOnce(showingButtonsConstraints2, hidingButtonsConstraints2, initialVisibilityStateHidden: true)
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

