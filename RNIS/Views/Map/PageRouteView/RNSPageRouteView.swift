//
//  RNSPageRouteView.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Представление показывает детальную информацию для нескольких варинатов маршрута с вожностью пролистывания
 */
class RNSPageRouteView: BaseViewWithXIBInit {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    /// массив моделей маршрутов
    var items: [RNSRouteVariant]? {
        return RNSPageRouteManager.items
    }
    
    var itemsCount: Int {
        return items?.count ?? 0
    }
     
    var currentIndexPath: IndexPath? {
        return collectionView.indexPathForItem(at: collectionView.contentOffset)
    }
    
    func reloadData() {
        pageControl.numberOfPages = itemsCount
        collectionView.reloadData()
    }

    /// метод обработки загрузки вью
    override func awakeFromNib() {
        super.awakeFromNib()
        
        reloadData()
        prepareSizeCell()
        prepareHandlers()
    }
    
    /// Подписка на клоужеры
    func prepareHandlers() {
        RNSPageRouteManager.handlerUpdateCurrent = { [weak self] in
            self?.prepareCurrentItem()
        }
    }
    
    func prepareSizeCell() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: UIScreen.width, height: 176)
        }
    }
}
