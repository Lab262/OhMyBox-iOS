//
//  ProfilePresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 11/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

protocol ProfileView {
    
    func startLoadingPhoto()
    func finishLoadingPhoto()
    func setPhoto(_ photo: UIImage?)
    
    func startLoadingMeasures()
    func finishLoadingMeasures()
    
    var measures: Measures.ViewData? {get set}
}

class ProfilePresenter: NSObject {
    
    var view: ProfileView
    
    init(view: ProfileView) {
        
        self.view = view
    }
    
    var currentUser: User? {
        
        return User.current
    }
    
    var userName: String {
        
        return currentUser?.fullName ?? ""
    }
    
    var userEmail: String {
        
        return currentUser?.email ?? ""
    }
    
    func getUserPhoto() {
        
        if let user = currentUser {
            
            view.startLoadingPhoto()
            user.photo?.getDataInBackground() { (data, error) in
                
                if let data = data {
                    
                    let image = UIImage(data: data)
                    
                    self.view.setPhoto(image)
                    
                } else {
                    
                    self.view.setPhoto(nil)
                }
                
                self.view.finishLoadingPhoto()
            }
        }
    }
    
    func loadCurrentUserMeasures() {
        
        if let user = currentUser {
            
            let ownerKey = #keyPath(Measures.ownerId)
            
            let query = PFQuery(className: Measures.parseClassName())
            query.whereKey(ownerKey, equalTo: user.objectId as Any)
            
            query.findObjectsInBackground(block: { (objects, error) in
                
                if let objects = objects {
                    
                    self.view.measures = (objects.first as? Measures)?.viewData
                } else {
                    
                    self.view.measures = nil
                }
            })
        }
    }
}


