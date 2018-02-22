//
//  RNSRegisterCollectionView.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс базовый для коллекции
 */
class RNSRegisterCollectionView: UICollectionView {

    @IBInspectable var registerCellIdentifier: String {
        get { return "" }
        set {
            if !newValue.isEmpty {
                self.registerCell(newValue)
            }
        }
    }
}
