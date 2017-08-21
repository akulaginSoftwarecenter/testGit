//
//  RNSPageRouteView+CollectionView.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSPageRouteView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func prepareSizeCell() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
             layout.itemSize = CGSize(width: UIScreen.width, height: 179)
        }
    }
    
    var itemsCount: Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as RNSPageRouteCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
}
