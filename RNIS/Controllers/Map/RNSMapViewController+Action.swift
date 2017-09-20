//
//  RNSMapViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapViewController {
    
    @IBAction func menuAction(_ sender: Any) {
        RNSMenuManager.showLeftMenu()
    }
    
    @IBAction func actionRoute(_ sender: Any) {
        RNSDutyViewController.initialPushAnimatedRed()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        let vc = STRouter.scrollContainer(RNSSearchViewController.initialController, isNeedAddTap: false)
        vc?.pushAnimatedRed()
    }
}
