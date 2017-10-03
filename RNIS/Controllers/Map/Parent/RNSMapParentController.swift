//
//  RNSMapParentController.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMapParentController: UIViewController {
    /**
     base mapview PGView
     */
    var mapView: MapView {
        return RNSMapManager.mapView
    }
    @IBOutlet weak var labelZoom: UILabel!
    @IBOutlet weak var plusButtonZoom: UIButton!
    @IBOutlet weak var minusButtonZoom: UIButton!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RNSMapManager.startLocation()
        prepareTargetIcon()
        updateZoom()
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
