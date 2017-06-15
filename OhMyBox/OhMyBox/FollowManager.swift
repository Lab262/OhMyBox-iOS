//
//  FollowManager.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 15/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class FollowManager: NSObject {

    static let shared: FollowManager = {
        return FollowManager()
    }()
    
    override private init() {
        
        super.init()
    }
    
    var followedBrandsIds: [String] = []
    
    func brandIsFollowed(_ brand: Brand) -> Bool {
        
        guard let brandId = brand.objectId else { return false }
        return followedBrandsIds.contains(brandId)
    }
    
    func loadFollows() {
        
        guard let user = User.current else { return }
        
        let query = PFQuery(className: Follow.parseClassName()).whereKey("follower", equalTo: user).includeKey("brand")
        
        query.findObjectsInBackground { (objects, error) in
            
            self.followedBrandsIds.removeAll(keepingCapacity: true)
            
            if let objects = objects as? [Follow] {
                
                self.followedBrandsIds = objects.flatMap { $0.followed.objectId }
            }
        }
    }
    
    private func setBrandFollowed(brand: Brand, completionHandler: ((Bool, Error?) -> ())? = nil) {
        
        guard let user = User.current else { return }
        
        let follow = Follow(follower: user, followed: brand)
        follow.saveInBackground { (success, error) in
            
            if success {
                
                guard let brandId = brand.objectId else { return }
                self.followedBrandsIds.append(brandId)
            }
            completionHandler?(success, error)
        }
    }
    
    private func setBrandUnfollowed(brand: Brand, completionHandler: ((Bool, Error?) -> ())? = nil) {
        
        guard let user = User.current else { return }
        
        let query = PFQuery(className: Follow.parseClassName()).whereKey("follower", equalTo: user).whereKey("followed", equalTo: brand)
        
        query.findObjectsInBackground { (objects, error) in
            
            guard let follows = objects as? [Follow] else {
                
                completionHandler?(false, nil)
                return
            }
            
            guard let follow = follows.first else { return }
            
            follow.deleteInBackground { (success, error) in
                
                if success {
                    
                    guard let brandId = brand.objectId else { return }
                    _ = self.followedBrandsIds.remove(brandId)
                }
                completionHandler?(success, error)
            }
        }
    }
    
    func updateFollows(withBrand brand: Brand) {
        
        guard brand.objectId != nil else { return }
        let followed = brandIsFollowed(brand)
        
        let handler: PFBooleanResultBlock = { (success, error) in
            
            NotificationCenter.default.post(name: Notifications.followsUpdated, object: nil)
        }
        
        if followed {
            
            setBrandUnfollowed(brand: brand, completionHandler: handler)
        } else {
            
            setBrandFollowed(brand: brand, completionHandler: handler)
        }
    }

}
