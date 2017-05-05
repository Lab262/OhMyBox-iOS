//
//  CartManager.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 05/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class CartManager: NSObject {

    static let shared: CartManager = {
        return CartManager()
    }()
    
    override private init() {
        super.init()
    }
    
    let userDefaults = UserDefaults.standard
    
    var cartBoxes: [Box] {
        
        let cartBoxes: [Box] = cartBoxReflections.flatMap { (reflection) -> Box in
            
            let box = Box(className: Box.parseClassName(), dictionary: reflection)
            box.objectId = reflection["objectId"] as? String
            
            return box
        }

        return cartBoxes
    }
    
    var cartBoxReflections: [PFObject.ReflectionType] {
        
        let reflections = userDefaults.array(forKey: UserDefaultsKeys.cartBoxes) as? [PFObject.ReflectionType]
        
        return reflections ?? []
    }
    
    func boxIsInCart(_ box: Box) -> Bool {
        
        return self.cartBoxes.contains(box)
    }
    
    func updateCart(withBox box: Box) {
        
        let cartBoxes: [Box]
        if boxIsInCart(box) {
            
            cartBoxes = self.cartBoxes.by(removing: box)
        } else {
            
            cartBoxes = self.cartBoxes.by(adding: box)
        }
        
        let cartBoxReflections = cartBoxes.map { $0.reflection }
        userDefaults.set(cartBoxReflections, forKey: UserDefaultsKeys.cartBoxes)
        
        userDefaults.synchronize()
    }
    
}
