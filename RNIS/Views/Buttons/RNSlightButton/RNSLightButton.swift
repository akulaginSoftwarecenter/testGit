//
//  RNSLightButton.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Light Button
 */

class RNSLightButton: BaseViewWithXIBInit {
    
    var handlerAction: EmptyBlock?
    lazy var loaderView:LoaderView = LoaderView()
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateStateLightButton()
        button.touchUpInside(handler: changeTraffic)
    }
    
    func loadTraffic(minCoord: PGGeoPoint?, maxCoord: PGGeoPoint?, zoom: Int32?) {
        //loaderView.showInView(self)
        RNSGetTraffic(minCoord: minCoord, maxCoord: maxCoord, zoom: zoom) {[weak self] (reply, error, handleError) in
            //self?.loaderView.remove()
            self?.prepareAverageTraffic(reply as? Int)
        }
    }
    
    func prepareAverageTraffic(_ average: Int?) {
        prepareImage(average)
        prepareLabel(average)
    }
    
    func prepareLabel(_ average: Int?) {
        guard let average = average else {
            return
        }
        if (average == 0) {
            hiddenLabel()
        }else {
            label.text = String(average);
            label.isHidden = false;
        }
    }
    
    func prepareImage(_ average: Int?) {
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
        setImage(image)
    }
    
    func setImage(_ image: UIImage?) {
        button.setImage(image, for: UIControlState())
    }
    
    func hiddenLabel() {
        label.isHidden = true;
    }
    
    func hiddenTraffic() {
        setImage(#imageLiteral(resourceName: "svetofor_deselect"))
        label.isHidden = true;
    }
    
    deinit {
        print("RNSLightButton deinit")
    }
}
