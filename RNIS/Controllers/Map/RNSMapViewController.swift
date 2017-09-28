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

    var containerController: RNSMapParentController?
     
    var presentViewController: UIViewController?
    
    /**
    route in RNSPostRouting com.rnis.geo.action.service.routing
     */
    var route: PGPolyline?
    
    lazy var loaderView:LoaderView = {
        let view = LoaderView()
        view.isUserInteractionEnabled = false
        view.labelText.text = "Обновление остановок..."
        view.defaultAlpha = 0.2
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //RNSMapManager.prepareStub()
        _ = RNSMapManager.shared.pinMyLocation
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        prepareHandlers()
    }
    
    func showLoader() {
        loaderView.showInView(self.view)
    }
    
    func removeLoader() {
        loaderView.remove()
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }

    deinit {
        print("RNSMapViewController deinit")
    }
}

