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
    
    @IBOutlet weak var trafficValueLabel: UILabel!
    @IBOutlet weak var lightButton: RNSLightButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMapView()
        prepareLightButton()
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
    
    var getTraffic: Bool {
        return mapView.getTraffic()
    }
    
    func changeTraffic() {
        mapView.setTraffic(!getTraffic)
        updateStateLightButton()
        
    }
    
    func prepareLightButton() {
        lightButton.handlerAction = { [weak self] in
            self?.changeTraffic()
        }
        updateStateLightButton()
    }
    
    func updateStateLightButton() {
        if getTraffic {
            lightButton.loadTraffic(getTraffic: getTraffic, minCoord: mapView.lastMinCoord, maxCoord: mapView.lastMaxCoord, zoom: mapView.getZoomLevel())
        } else {
            lightButton.hiddenLabel()
        }
    }
    /*
    func loadLightButton() {
        lightButton.isSelected =  !getTraffic
        lightButton.isUserInteractionEnabled = false
        
        let pointMin = mapView.lastMinCoord;
        let pointMax = mapView.lastMaxCoord;
        SVProgressHUD.show()
        RNSGetTraffic(minCoord: pointMin, maxCoord: pointMax, zoom: mapView.getZoomLevel()) {[weak self] (reply, error, handleError) in
            SVProgressHUD.dismiss()
            self?.prepareAverageTraffic(reply as? Int)
        }
    }
    
    func prepareAverageTraffic(_ average: Int?) {
        lightButton.isUserInteractionEnabled = true;
        guard let average = average else {
            return
        }
        var image:UIImage
        if (average == 0) {
            image = #imageLiteral(resourceName: "svetofor_selected")
        } else if (average < 4) {
            image = #imageLiteral(resourceName: "ic_svetofor_green")
         }else if (average < 7){
            image = #imageLiteral(resourceName: "ic_svetofor_orange")
        }else {
            image = #imageLiteral(resourceName: "ic_svetofor_red")
        }
        lightButton.setImage(image, for: .selected)

        if (average == 0) {
            trafficValueLabel.isHidden = true;
        }else {
            trafficValueLabel.text = String(average);
            trafficValueLabel.isHidden = false;
        }
    }
    
    func disableTraffic() {
        trafficValueLabel.isHidden = true;
    }
    */
}

