//
//  RNSPageRouteView+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSPageRouteView {
    
    func updateMap() {
        RNSPageRouteManager.updateMap(item(currentIndexPath))
    }
    
    func updatePageControl(_ index: Int? ) {
        guard let index = index else {
            return
        }
        pageControl.currentPage = index
    }
    
    func prepareCurrentItem() {
        guard let index = RNSPageRouteManager.currentIndex,
            let collectionIndex = currentIndexPath?.row, collectionIndex != index else {
                return
        }
        updatePageControl(index)
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
}
