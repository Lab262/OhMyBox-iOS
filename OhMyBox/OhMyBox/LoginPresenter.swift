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
    
    func showHomeViewController()
}

class LoginPresenter: NSObject {

    var view: LoginView?
    
    init(view: LoginView) {
        
        super.init()
        self.view = view
    }
    
    func login(with username: String, password: String) {
        
        UserRequest.login(with: username, password: password) { (error) in
            
            if error == nil {
                
                self.view?.showHomeViewController()
            } else {
                
                print(error!.localizedDescription)
            }
        }
    }
    
    func loginWithFacebook() {
        
        UserRequest.loginWithFacebook() { (success, error) in
            
            if success {
                
                self.view?.showHomeViewController()
            } else if let error = error {
                
                print(error.localizedDescription)
            }
        }
    }
    
}
