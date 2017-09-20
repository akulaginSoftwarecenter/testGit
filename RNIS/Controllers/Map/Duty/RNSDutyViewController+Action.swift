//
//  RNSDutyViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSDutyViewController {
    
    @IBAction func actionExchange(_ sender: Any) {
        let inText = self.inText
        let fromText = self.fromText
        fromField.text = inText
        inField.text = fromText
    }
    
    @IBAction func actionFrom(_ sender: Any) {
        showAddress(.fromAddress) {[weak self] (text) in
            self?.fromField.text = text
        }
    }
    
    @IBAction func actionIn(_ sender: Any) {
        showAddress(.inAddress) {[weak self] (text) in
            self?.inField.text = text
        }
    }
    
    @IBAction func dateAction(_ sender: Any) {
        
        viewLabelDate.isHidden = true
        let vc = RNSDateSelectViewController.initialController as? RNSDateSelectViewController
        vc?.handlerDate = { [weak self] date in
            self?.prepareDate(date)
        }
        vc?.handlerDismiss = { [weak self] in
            self?.viewLabelDate.isHidden = false
        }
        STRouter.present(vc)
    }
    
    @IBAction func crossAction(_ sender: Any) {
        prepareDate(nil)
    }
    
    func showAddress(_ type: TypeAddress, complete: AliasStringBlock?) {
        let text = type == .fromAddress ? fromText : inText
        RNSAddressViewController.initController(text, type: type, complete: complete)?.pushAnimated()
    }
}
