//
//  TransportViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение для работы с представлением переключения вкладок
extension TransportViewController {

    /// Событие изменения активной вкладки
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        myRoutesView.isHidden = selectedSegmentIndexIsFirst
        favoritesBusView.isHidden = !selectedSegmentIndexIsFirst
        titleLable.text = titleSelected
        updateItemsIfNeed()
    }
    
    /// Обновление представлений
    func updateItemsIfNeed() {
        if selectedSegmentIndexIsFirst {
            RNSMenuManager.updateFavoriteBuss()
        } else {
            RNSPageRouteManager.updateFavorite()
        }
    }
    
    /// Преднастройка представления
    func prepareSegment() {
        segmentControl.selectedSegmentIndex = 0
        segmentControlAction(self.segmentControl)
    }
    
    /// Получение индекса активной вкладки
    var selectedSegmentIndex: Int {
        return self.segmentControl.selectedSegmentIndex
    }
    
    /// Проверка является ли активная вкладка первой
    var selectedSegmentIndexIsFirst: Bool {
        return selectedSegmentIndex == 0
    }
    
    /// Получение названия для активной вкладки
    var titleSelected: String {
        return selectedSegmentIndexIsFirst ? "Мой транспорт" : "Мои маршруты"
    }
}
