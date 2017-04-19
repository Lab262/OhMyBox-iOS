//
//  LoginPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 10/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse
import ParseFacebookUtilsV4

protocol LoginView {
    
    func didFinishLogin(_ success: Bool, error: Error?)
}

class LoginPresenter: NSObject {

    var view: LoginView
    
    init(view: LoginView) {
        
        self.view = view
        
        super.init()
    }
    
    func login(with username: String, password: String) {
        
        UserRequest.login(with: username, password: password) { (error) in
            
            self.view.didFinishLogin(error == nil, error: error)
        }
    }
    
    func loginWithFacebook() {
        
        UserRequest.loginWithFacebook() { (success, error) in
            
            self.view.didFinishLogin(success, error: error)
        }
    }
    
    func forgotPassword(forEmail email: String) {
        
        User.requestPasswordResetForEmail(inBackground: email) { (success, error) in
            
        }
    }
    
}
