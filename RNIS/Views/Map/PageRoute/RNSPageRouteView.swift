//
//  RNSPageRouteView.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPageRouteView: BaseViewWithXIBInit {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    func reloadData() {
        pageControl.numberOfPages = itemsCount
        collectionView.reloadData()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        reloadData()
        prepareSizeCell()
        prepareHandlers()
    }
    
    func prepareHandlers() {
        RNSPageRouteManager.handlerUpdateCurrent = { [weak self] in
            self?.prepareCurrentItem()
        }
    }
    
    func prepareCurrentItem() {
        guard let index = RNSPageRouteManager.currentIndex,
            let collectionIndex = collectionView.indexPathsForVisibleItems.first?.row, collectionIndex != index else {
            return
        }
        
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
}
