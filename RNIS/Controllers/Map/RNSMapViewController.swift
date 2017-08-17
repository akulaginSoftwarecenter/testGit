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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        containerController = segue.destination as? RNSMapParentController
        prepareEnterViewController()
    }
    
    func prepareEnterViewController(){
        containerController?.handlerOnMapEvent = {[weak self] in
            self?.onMapEvent()
        }
        
        containerController?.handlerOnMapTouchEvent = {[weak self] point in
            self?.onMapTouchEvent(point)
        }
        
        containerController?.handlerOnMapLongTouchEvent = {[weak self] point in
            self?.onMapLongTouchEvent(point)
        }
        
        containerController?.handlerOnOverlay = {[weak self] point,item in
            self?.onOverlay(point, item: item)
        }
    }
    
    var presentViewController: UIViewController?
    
    /**
    route in RNSPostRouting com.rnis.geo.action.service.routing
     */
    var route: PGPolyline?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        RNSMapManager.prepareStub()
        
        //STRouter.showAlert("Зарегистрируйтесь, чтобы открыть все возможности приложения")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        prepareHandlers()
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }

    deinit {
        print("RNSMapViewController deinit")
    }
}

