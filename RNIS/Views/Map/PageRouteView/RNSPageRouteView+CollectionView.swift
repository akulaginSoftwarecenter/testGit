//
//  RNSPageRouteView+CollectionView.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Page Route View + Collection View
 */


extension RNSPageRouteView: UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as RNSPageRouteCell
        cell.item = item(indexPath)
        return cell
    }
    
    func item(_ indexPath: IndexPath?) -> RNSRouteVariant? {
        guard let indexPath = indexPath else {
            return nil
        }
        return items?[indexPath.row]
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updateMap()
        RNSPageRouteManager.currentPrepareDisplay()
        updatePageControl(currentIndexPath?.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = RNSRouteDetailController.initController(item(indexPath))
        vc?.handlerBack = { 
            STRouter.pop()
        }
        vc?.pushAnimatedRed()
    }
}
