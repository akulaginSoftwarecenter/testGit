//
//  ViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import PureLayout
import SVProgressHUD

class RNSMapViewController: UIViewController {
    
    lazy var mapView: MapView = {
        let mapView = MapView()
        self.view.insertSubview(mapView, at: 0)
        mapView.autoPinEdgesToSuperviewEdges()
        mapView.startApplication()
        mapView.clearMapCache()
        mapView.setMapHost(mapHost)
        mapView.setTrafficMarksHost(mapHost)
        mapView.enterForeground()
        mapView.enableMyLocation()
        mapView.setMapRegime(1)
        let overlay = mapView.myLocationOverlay()
        overlay?.setBitmap(#imageLiteral(resourceName: "ic_userLocation"), xOffset: 0, yOffset: 0)
        overlay?.setRotationEnabled(false)
        return mapView
    }()
    
    @IBOutlet weak var lightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMapView()
    }
    
    func prepareMapView() {
        mapView.enableCompass()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startLocation()
    }
    
    func startLocation() {
        RNSLocationManager.startLocation { [weak self] in
             self?.centerUserLocation()
        }
    }
    
    func centerUserLocation() {
        mapView.setMapCenter(RNSLocationManager.point)
        mapView.setZoomLevel(13)
    }
    
    func changeTraffic() {
        //lightButton.isSelected =  !trafficEnabled
        //lightButton.isUserInteractionEnabled = false
        
        mapView.setTraffic(!mapView.getTraffic())
        /*
        if trafficEnabled {
            enableTraffic()
        } else {
            disableTraffic()
        }
 */
    }
    
    func enableTraffic() {
        let pointMin = mapView.lastMinCoord;
        let pointMax = mapView.lastMaxCoord;
  //      SVProgressHUD.show()
    }
    
    func disableTraffic() {
        lightButton.isUserInteractionEnabled = true;
        //self.trafficValueLabel.hidden = YES;
        //self.landscapeMapOrientationView.trafficValueLabel.hidden = YES;
    }
}

