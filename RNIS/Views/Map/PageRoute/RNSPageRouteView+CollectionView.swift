//
//  RNSPageRouteView+CollectionView.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSPageRouteView: UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    
    func prepareSizeCell() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
             layout.itemSize = CGSize(width: UIScreen.width, height: 179)
        }
    }
    
    var items: [RNSRouteVariant]? {
        return RNSPageRouteManager.items
    }
    
    var itemsCount: Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as RNSPageRouteCell
        cell.item = item(indexPath)
        return cell
    }
    
    func item(_ indexPath: IndexPath) -> RNSRouteVariant? {
        return items?[indexPath.row]
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let indexPath = collectionView.indexPathForItem(at: collectionView.contentOffset) else {
            return
        }

        pageControl.currentPage = indexPath.row
        RNSPageRouteManager.updateMap(item(indexPath))
    }
}
