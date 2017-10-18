//
//  RNSMapParentController.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 RNSMapParentController
 */

class RNSMapParentController: UIViewController {
    /**
     base mapview PGView
     */
    var mapView: MapView {
        return RNSMapManager.mapView
    }
    //
    @IBOutlet weak var labelZoom: UILabel!
    @IBOutlet weak var plusButtonZoom: UIButton!
    @IBOutlet weak var minusButtonZoom: UIButton!
    @IBOutlet var showingButtonsConstraints: [NSLayoutConstraint]!
    @IBOutlet var hidingButtonsConstraints: [NSLayoutConstraint]!
    @IBOutlet weak var leftStackView: UIStackView!
    @IBOutlet weak var rightStackView: UIStackView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    //
    var handlerOnMapEvent: EmptyBlock?
    var handlerOnMapTouchEvent: AliasPointBlock?
    var handlerOnMapLongTouchEvent: AliasPointBlock?
    var handlerOnOverlay: ((PGOverlay,PGOverlayItem) -> ())?
    
    var bottomTargetConstant: CGFloat?
    @IBOutlet weak var bottomTarget: NSLayoutConstraint!
    
    @IBOutlet weak var lightButton: RNSLightButton!
    
    lazy var loaderView:LoaderView = {
        let view = LoaderView()
        view.isUserInteractionEnabled = false
        view.labelText.text = "Обновление остановок..."
        view.defaultAlpha = 0.2
        return view
    }()
    private var animator: MapButtonsAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTargetIcon()
        updateZoom()
        prepareAnimator()
    }
    
    func prepareAnimator() {
        animator = MapButtonsAnimator(superview: view, duration: 0.3, usingSpringAnimation: false)
        animator.extraAnimationsWithVisibilityStateHidden = { [weak self] in
            self?.menuButton.alpha = $0 ? 0 : 1
            self?.searchButton.alpha = $0 ? 0 : 1
            self?.leftStackView.alpha = $0 ? 0 : 1
            self?.rightStackView.alpha = $0 ? 0 : 1
        }
    }
    
    func updateZoom() {
        labelZoom.text = "zoom = \(mapView.getZoomLevel())"
    }
    
    func prepareTargetIcon() {
        guard let constant = bottomTargetConstant else {
            return
        }
        bottomTarget.constant = constant
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        plusButtonZoom.isHidden = UserDefaults.hideZoomButtonInMap
        minusButtonZoom.isHidden = UserDefaults.hideZoomButtonInMap
        prepareMapView()
        navigationController?.navigationBar.isHidden = true
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
    
    func busUpdate() {
        showLoader()
        RNSBusManager.updateServer { [weak self] in
            self?.removeLoader()
        }
    }
    
    func busStopUpdate() {
        showLoader()
        RNSBusStopManager.updateServer { [weak self] in
            self?.removeLoader()
        }
    }
    
    func showLoader() {
        loaderView.showInView(self.view)
    }
    
    func removeLoader() {
        loaderView.remove()
    }
    
    deinit {
        print("RNSMapParentController deinit")
    }
}
