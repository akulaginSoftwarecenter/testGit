//
//  RNSWelcomeViewContoller.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

struct WelcomeItem {
    init(_ back: UIImage?, title: String?, desc: String? = nil, main: UIImage? = nil, startImage: UIImage? = nil) {
        self.back = back
        self.startImage = startImage
        self.main = main
        self.desc = desc
        self.title = title
    }
    
    var back: UIImage?
    var startImage: UIImage?
    var main: UIImage?
    var title: String?
    var desc: String?
}

class RNSWelcomeViewContoller: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var titleButton: UILabel!
    
    var currentIndexPath: IndexPath? {
        return collectionView.indexPathForItem(at: collectionView.contentOffset)
    }
    
    lazy var items: [WelcomeItem] = {
        return [WelcomeItem(nil,title: "Будьте в курсе где сейчас ваш автобус и сколько его ждать", startImage: #imageLiteral(resourceName: "welc0Back")),
                WelcomeItem(#imageLiteral(resourceName: "welc1Back"),title: "Поиск маршрутов", desc: "Стройте маршруты на общественном транспорте до нужного адреса в Подмосковье", main: #imageLiteral(resourceName: "welc1")),
                WelcomeItem(#imageLiteral(resourceName: "welc2Back"),title: "Контроль", desc: "Участвуйте в улучшении работы общественного транспорта Подмосковья.", main: #imageLiteral(resourceName: "welc2")),
                WelcomeItem(#imageLiteral(resourceName: "welc3Back"),title: "Расписание", desc: "Смотрите расписание на остановке и по конкретному автобусу", main: #imageLiteral(resourceName: "welc3")),
                WelcomeItem(#imageLiteral(resourceName: "welc4Back"),title: "Избранное", desc: "Сохраняйте любимые маршруты и остановки с расписаниями, что бы они всегда были под рукой", main: #imageLiteral(resourceName: "welc4"))]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareSizeCell()
        collectionView.reloadData()
        updatePage()
    }
    
    func prepareSizeCell() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = UIScreen.size
        }
    }
    
    func updatePage() {
        guard let index = currentIndexPath?.row,
            let item = item(currentIndexPath) else {
            return
        }
        pageControl.currentPage = index
        labelTitle.text = item.title
        labelDesc.text = item.desc
        titleButton.text = index == 4 ? "Перейти к приложению" : "Пропустить"
    }
    
    override class var storyboardName: String {
        return "RNSWelcomeViewContoller"
    }
}
