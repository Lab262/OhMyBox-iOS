//
//  ProfilePresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 11/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol ProfilePresenterDelegate {
    
}

class ProfilePresenter: NSObject {
    
    var controller: ProfilePresenterDelegate?
    
    init(controller: ProfilePresenterDelegate) {
        
        self.controller = controller
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
    
    func getUserPhoto(completionHandler: ((UIImage?) -> ())?) {
        
        if let user = currentUser {
            
            user.photo?.getDataInBackground() { (data, error) in
                
                if let data = data {
                    
                    let image = UIImage(data: data)
                    completionHandler?(image)
                } else {
                    
                    completionHandler?(nil)
                }
            }
        }
    }
}
