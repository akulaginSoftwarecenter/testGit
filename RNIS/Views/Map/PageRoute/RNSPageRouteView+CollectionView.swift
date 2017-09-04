//
//  RNSPageRouteView+CollectionView.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

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
        updatePageControl(currentIndexPath?.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         RNSRouteDetailController.initController(item(indexPath)?.tableItem)?.pushAnimatedRed()
    }
}
