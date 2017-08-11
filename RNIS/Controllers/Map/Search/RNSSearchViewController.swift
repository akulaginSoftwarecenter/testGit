//
//  RNSSearchViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSSearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func actionSegmented(_ sender: UISegmentedControl) {
        for indx in 0 ... sender.subviews.count-1 {
            let subview = sender.subviews[indx]
            if indx != sender.selectedSegmentIndex {
                let color = UIColor.D95A53
                subview.tintColor = color
                subview.backgroundColor = color
            } else {
                subview.tintColor = nil
                subview.backgroundColor = nil
            }
        }
    }
    
    override class var storyboardName: String {
        return "RNSSearchViewController"
    }
}
