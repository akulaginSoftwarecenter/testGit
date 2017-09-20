//
//  RNSRedContainer.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRedContainer: RNSParentContainer {
    
    override func prepareView() {
        super.prepareView()
        
        let backgroundView = UIView(frame: view.bounds)
        backgroundView.backgroundColor = .backColor
        view.addSubview(backgroundView)
    }
}
