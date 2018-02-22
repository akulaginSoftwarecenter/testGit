//
//  RNSLeftMenuController+Profile.swift
//  RNIS
//
//  Created by Артем Кулагин on 27.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с профилем
 */
extension RNSLeftMenuController {
    
    /// Возвращает булевое значение, указывающее сохранен ли токен сессии
    var isHaveEmail: Bool {
        return UserDefaults.isHaveEmail
    }
    
    /// Настройка профиля
    func prepareProfile() {
        clearProfile()
        if isHaveEmail {
            loadData()
        } else {
            prepareName("Авторизация")
            preparePhone(nil)
        }
        editButton.isHidden = !isHaveEmail
    }
    
    /// Загрузка данных профиля
    func loadData() {
        loaderView.showInView(backLoaderView)
        RNSPostUserGet {[weak self] (reply, error, _) in
            self?.loaderView.remove()
            self?.updateUI(reply as? RNSUserPayload)
        }
    }
    
    /// Обновление представлений
    ///
    /// - Parameter item: данные профиля пользователя
    func updateUI(_ item: RNSUserPayload?) {
        prepareInfoMail(item?.email)
        prepareName(item?.name)
        preparePhone(item?.email)
        item?.loadImage { [weak self] image in
            self?.prepareImageProfile(image)
        }
    }
    
    /// Очистка представлений
    func clearProfile() {
        prepareName(nil)
        preparePhone(nil)
        prepareImageProfile(nil)
        prepareInfoMail(nil)
    }
    
    func prepareName(_ text: String?) {
        nameLabel.text = text
    }
    
    func preparePhone(_ text: String?) {
        phoneLabel.text = text
    }
    
    func prepareImageProfile(_ image: UIImage?) {
        profileImageView.image = image ?? #imageLiteral(resourceName: "avatarPlaceholderImage")
    }
    
    func prepareInfoMail(_ mail: String?) {
        RNSInfoManager.email = mail
    }
}
