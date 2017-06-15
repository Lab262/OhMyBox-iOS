//
//  WishlistManager.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 22/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

enum WishlistError: Error {
    
    case wishNotFound
}

class WishlistManager: NSObject {
    
    struct UpdateUserInfoKeys {
        
        static let boxId = "boxId"
        static let isInWishlist = "isInWishlist"
    }
    
    static let shared: WishlistManager = {
        return WishlistManager()
    }()
    
    override private init() {
        
        super.init()
    }
    
    var favoriteBoxesIds: [String] = []
    
    func boxIsInWishlist(_ box: Box) -> Bool {
        
        return favoriteBoxesIds.contains {
            
            box.objectId == $0
        }
    }
    
    func loadWishlist() {
        
        guard let user = User.current else { return }
        
        let query = PFQuery(className: Wishlist.parseClassName()).whereKey("user", equalTo: user).includeKey("box")
        
        query.findObjectsInBackground { (objects, error) in
            
            self.favoriteBoxesIds.removeAll(keepingCapacity: true)
            
            if let objects = objects as? [Wishlist] {
                
                self.favoriteBoxesIds = objects.flatMap { $0.box.objectId }
            }
        }
    }
    
    private func setBoxFavorite(box: Box, completionHandler: ((Bool, Error?) -> ())? = nil) {
        
        guard let user = User.current else { return }
        
        let wishlist = Wishlist(user: user, box: box)
        wishlist.saveInBackground { (success, error) in
            
            if success {
                
                guard let boxId = box.objectId else { return }
                self.favoriteBoxesIds.append(boxId)
            }
            completionHandler?(success, error)
        }
    }
    
    private func setBoxUnfavorite(box: Box, completionHandler: ((Bool, Error?) -> ())? = nil) {
        
        guard let user = User.current else { return }
        
        let query = PFQuery(className: Wishlist.parseClassName()).whereKey("user", equalTo: user).whereKey("box", equalTo: box)
        
        query.findObjectsInBackground { (objects, error) in
            
            guard let wishes = objects as? [Wishlist] else {
            
                completionHandler?(false, WishlistError.wishNotFound)
                return
            }
            
            guard let wish = wishes.first else { return }
            
            wish.deleteInBackground { (success, error) in
                
                if success {
                    
                    guard let boxId = box.objectId else { return }
                    _ = self.favoriteBoxesIds.remove(boxId)
                }
                completionHandler?(success, error)
            }
        }
    }
    
    func updateWishlist(withBox box: Box) {
        
        guard let boxId = box.objectId else { return }
        let boxIsInWishlist = favoriteBoxesIds.contains(boxId)
        
        let handler: PFBooleanResultBlock = { (success, error) in
            
            NotificationCenter.default.post(name: Notifications.wishlistUpdated, object: nil)
        }
        
        if boxIsInWishlist {
            
            setBoxUnfavorite(box: box, completionHandler: handler)
        } else {
            
            setBoxFavorite(box: box, completionHandler: handler)
        }
    }
}
