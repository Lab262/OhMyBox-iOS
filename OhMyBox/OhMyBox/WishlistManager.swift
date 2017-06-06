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
    
    var favoriteBoxes: [Box] = []
    
    func boxIsInWishlist(_ box: Box) -> Bool {
        
        return favoriteBoxes.contains(box)
    }
    
    func loadWishlist() {
        
        guard let user = User.current else { return }
        
        let query = PFQuery(className: Wishlist.parseClassName()).whereKey("user", equalTo: user).includeKey("box")
        
        query.cachePolicy = .cacheThenNetwork
        query.findObjectsInBackground { (objects, error) in
            
            if let objects = objects as? [Wishlist] {
                
                let boxes = objects.map { $0.box }
                
                boxes.forEach {
                    
                    do {
                        try $0.brand.fetchIfNeeded()
                        try $0.queryProductsSync()
                    } catch {
                        print(error)
                    }
                }
                
                self.favoriteBoxes = objects.map { $0.box }
                
                print("loaded")
                
            }
        }
    }
    
    private func setBoxFavorite(box: Box, completionHandler: ((Bool, Error?) -> ())? = nil) {
        
        guard let user = User.current else { return }
        
        let wishlist = Wishlist(user: user, box: box)
        wishlist.saveInBackground { (success, error) in
            
            if success {
                
                self.favoriteBoxes.append(box)
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
                    _ = self.favoriteBoxes.remove(box)
                }
                completionHandler?(success, error)
            }
        }
    }
    
    func updateWishlist(withBox box: Box) {
        
        let boxIsInWishlist = favoriteBoxes.contains(box)
        
        let handler: PFBooleanResultBlock = { (success, error) in
            
            // t+t = f >> t!=t = f
            // f+t = t >> f!=t = t
            // f+f = f >> f!=f = f
            // t+f = t >> t!=f = t
            let isInWishlist = boxIsInWishlist != success
            
            let notificationUserInfo: [String: Any] = [WishlistManager.UpdateUserInfoKeys.boxId: box.objectId!, WishlistManager.UpdateUserInfoKeys.isInWishlist: isInWishlist]
            NotificationCenter.default.post(name: Notifications.wishlistUpdated, object: notificationUserInfo)
        }
        
        if boxIsInWishlist {
            
            setBoxUnfavorite(box: box, completionHandler: handler)
        } else {
            
            setBoxFavorite(box: box, completionHandler: handler)
        }
    }
}
