//
//  CartManager.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 05/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class CartManager: NSObject {

    struct UpdateUserInfoKeys {
        
        static let boxId = "boxId"
        static let isInCart = "isInCart"
    }
    
    static let shared: CartManager = {
        return CartManager()
    }()
    
    override private init() {
        super.init()
    }
    
    let userDefaults = UserDefaults.standard
    
    var cartBoxes: [Box] {
        
        let cartBoxes: [Box] = cartBoxObjectIds.flatMap { (boxId) in
            BoxRequester.shared.boxes.where(lambda: { (box) -> (Bool) in
                return box.objectId == boxId
            })
        }

        return cartBoxes
    }
    
    var cartBoxObjectIds: [String] {
        
        let reflections = userDefaults.array(forKey: UserDefaultsKeys.cartBoxes) as? [String]
        
        return reflections ?? []
    }
    
    func boxIsInCart(_ box: Box) -> Bool {
        
        return self.cartBoxes.contains(box)
    }
    
    func updateCart(withBox box: Box) {
        
        guard let boxId = box.objectId else { return }
        
        let cartBoxes: [Box]
        
        let boxIsInCart = self.boxIsInCart(box)
        
        if boxIsInCart {
            
            cartBoxes = self.cartBoxes.by(removing: box)
        } else {
            
            cartBoxes = self.cartBoxes.by(adding: box)
        }
        
        let cartBoxObjectIds = cartBoxes.map { $0.objectId ?? "" }
        userDefaults.set(cartBoxObjectIds, forKey: UserDefaultsKeys.cartBoxes)
        
        userDefaults.synchronize()
        
        let notificationUserInfo: [String: Any] = [UpdateUserInfoKeys.boxId: boxId, UpdateUserInfoKeys.isInCart: !boxIsInCart]
        NotificationCenter.default.post(name: Notifications.cartUpdated, object: notificationUserInfo)
    }
    
}
