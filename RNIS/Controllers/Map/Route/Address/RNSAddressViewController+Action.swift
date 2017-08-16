//
//  RNSAddressViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSAddressViewController {
    
    @IBAction func actionMyLocation(_ sender: Any) {
        STRouter.showLoader()
        RNSLocationManager.geoCodeMylocation {[weak self] text in
            STRouter.removeLoader()
            self?.prepareAddress(text)
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        complete?(text)
        if let text = text {
            RNSDataManager.createSearchItem(text)
        }
    }
    
    @IBAction func actionTop(_ sender: Any) {
        endEdit()
    }
}
