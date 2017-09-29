//
//  RNSLeftMenuController+Profile.swift
//  RNIS
//
//  Created by Артем Кулагин on 27.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSLeftMenuController {
    
    var isHaveToken: Bool {
        return Utils.isHaveToken
    }
    
    func prepareProfile() {
        clearProfile()
        if isHaveToken {
            loadData()
        } else {
            prepareName("Регистрация")
            preparePhone("Бесплатно")
        }
    }
    
    func loadData() {
        loaderView.showInView(backLoaderView)
        RNSPostUserGet {[weak self] (reply, error, _) in
            self?.loaderView.remove()
            self?.updateUI(reply as? RNSUserPayload)
        }
    }
    
    func updateUI(_ item: RNSUserPayload?) {
        prepareName(item?.name)
        preparePhone(item?.formatPhone)
        item?.loadImage { [weak self] image in
            self?.prepareImageProfile(image)
        }
    }
    
    func clearProfile() {
        prepareName(nil)
        preparePhone(nil)
        prepareImageProfile(nil)
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
}
