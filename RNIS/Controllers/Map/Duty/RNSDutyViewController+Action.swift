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
        let item = fromItem
        fromItem = inItem
        inItem = item
        updateFields()
    }
    
    @IBAction func actionFrom(_ sender: Any) {
        showAddress(.fromAddress) {[weak self] (item) in
            self?.fromItem = item
            self?.updateFields()
        }
    }
    
    @IBAction func actionIn(_ sender: Any) {
        showAddress(.inAddress) {[weak self] (item) in
            self?.inItem = item
            self?.updateFields()
        }
    }
    
    @IBAction func dateAction(_ sender: Any) {
        let vc = RNSDateSelectViewController.initialController as? RNSDateSelectViewController
        vc?.transitioningDelegate = CustomTransitionDelegate.shared
        vc?.handlerDate = { [weak self] date in
            self?.prepareDate(date)
        }
        STRouter.present(vc)
    }
    
    @IBAction func crossAction(_ sender: Any) {
        prepareDate(nil)
    }
    
    func showAddress(_ type: TypeAddress, complete: AliasAddressComplete?) {
        let item = type == .fromAddress ? fromItem : inItem
        RNSAddressViewController.initController(item, type: type, complete: complete)?.pushAnimated()
    }
}
