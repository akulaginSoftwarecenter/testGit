//
//  NotificationsSettingsViewController+PickerView.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension NotificationsSettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel? = (view as? UILabel)
        if label == nil {
            label = UILabel()
            label?.font = .cffazm26
            label?.textAlignment = .center
            label?.textColor = .white
        }
        label?.text = "\(row)"
        guard let lbl = label else {
            return UIView()
        }
        return lbl
    }
}
