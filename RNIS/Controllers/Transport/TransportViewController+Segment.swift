//
//  TransportViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension TransportViewController {

    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        tableView.isHidden = !selectedSegmentIndexIsFirst
        //myRoutesView.isHidden = selectedSegmentIndexIsFirst
        if selectedSegmentIndexIsFirst {
            tableView.reloadData()
        } else {
            //myRoutesView.generate()
        }
        reloadTitle()
    }
    
    var selectedSegmentIndex: Int {
        return self.segmentControl.selectedSegmentIndex
    }
    
    var selectedSegmentIndexIsFirst: Bool {
        return selectedSegmentIndex == 0
    }
    
    var titleSelected: String {
        return selectedSegmentIndexIsFirst ? "Мой транспорт" : "Мои маршруты"
    }
}
