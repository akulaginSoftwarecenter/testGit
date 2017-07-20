//
//  RNSLightButton.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSLightButton: UIView {
    
    var handlerAction: EmptyBlock?
    lazy var loaderView:LoaderView = LoaderView()
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        button.touchUpInside(handler: handlerAction)
    }
    
    func loadTraffic(getTraffic: Bool, minCoord: PGGeoPoint?, maxCoord: PGGeoPoint?, zoom: Int32?) {
        button.isSelected =  !getTraffic
        loaderView.showInView(self)
        RNSGetTraffic(minCoord: minCoord, maxCoord: maxCoord, zoom: zoom) {[weak self] (reply, error, handleError) in
            self?.loaderView.remove()
            self?.prepareAverageTraffic(reply as? Int)
        }
    }
    
    func prepareAverageTraffic(_ average: Int?) {
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
        button.setImage(image, for: .selected)
        
        if (average == 0) {
            hiddenLabel()
        }else {
            label.text = String(average);
            label.isHidden = false;
        }
    }
    
    func hiddenLabel() {
        label.isHidden = true;
    }
}
