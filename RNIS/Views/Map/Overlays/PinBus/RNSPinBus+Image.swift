//
//  RNSPinBus+Image.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSPinBus {
    
    func updateImage() {
        guard let item = itemBus,
            let widthTitle = widthTitle else {
            return
        }
        let text = item.route_number
        let isCurrent = item.isCurrent
        DispatchQueue.global(qos: .background).async {
            let image = RNSImageFactory.imageBusAt(text, selected: isCurrent, widthText: widthTitle)
            Utils.mainQueue {
                self.setImage(image)
            }
        }
    }
    
    func setImage(_ image: UIImage) {
        guard imageSetuped != image else {
             return
        }
        imageSetuped = image
        prepareIcon(image)
    }
}
