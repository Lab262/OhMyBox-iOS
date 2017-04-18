//
//  RegisterPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 18/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol RegisterView {
    
    func didRegister(withSuccess success: Bool, message: String)
    func didFinishLoginWithFacebook(_ success: Bool, error: Error?)
}

class RegisterPresenter: NSObject {
    
    var view: RegisterView
    
    init(view: RegisterView) {
        
        self.view = view
    }
    
    func registerUser(_ user: User, password: String) {
        
        UserRequest.create(user: user, password: password) { (success, message) in
            
            self.view.didRegister(withSuccess: success, message: message)
        }
    }
    
    func loginWithFacebook() {
        
        UserRequest.loginWithFacebook() { (success, error) in
            
            self.view.didFinishLoginWithFacebook(success, error: error)
        }
    }
    
}
