//
//  RNSWelcomeViewContoller+CollectionView.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSWelcomeViewContoller: UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as RNSWelcomeCell
        cell.item = item(indexPath)
        return cell
    }
    
    func item(_ indexPath: IndexPath?) -> WelcomeItem? {
        guard let indexPath = indexPath else {
            return nil
        }
        return items[indexPath.row]
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updatePage()
    }
}
