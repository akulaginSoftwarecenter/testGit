//
//  RNSSearchViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSSearchViewController: UITextFieldDelegate {
    
    @IBAction func actionSegmented(_ sender: UISegmentedControl) {
        clearTable() 
        updateSearch()
    }
    
    @IBAction func editionChange(_ sender: Any) {
        updateSearch()
    }
      
    @IBAction func actionTop(_ sender: Any) {
         hideKeyboard()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    func hideKeyboard() {
        view.hideKeyboard()
    }
}
