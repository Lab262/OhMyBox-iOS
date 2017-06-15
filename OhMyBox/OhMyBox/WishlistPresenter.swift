//
//  WishlistPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 22/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class WishlistPresenter: NSObject {
    
    var favoriteBoxes: [Box] {
        
        return BoxRequester.shared.boxes.filter {
            
            guard let boxId = $0.objectId else { return false }
            return WishlistManager.shared.favoriteBoxesIds.contains(boxId)
        }
    }
    
}
