//
//  STImageContainer.swift
//  Spytricks
//
//  Created by Артем Кулагин on 10.04.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit

class STImageContainer: RNSParentContainer {
    
    override func prepareView() {
        super.prepareView()
        
        view.addBackGroundColor()
    }
}
