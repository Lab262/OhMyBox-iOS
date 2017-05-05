//
//  CartManager.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 05/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class CartManager: NSObject {

    let userDefaults = UserDefaults.standard
    
    var cartBoxes: [Box] {
        
        return cartBoxReflections.flatMap { Box(reflection: $0) }
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
    }
    
}
