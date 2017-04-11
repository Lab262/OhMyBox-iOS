//
//  LoginPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 10/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse
import ParseFacebookUtilsV4

class LoginPresenter: NSObject {

    var controller: LoginPresenterDelegate?
    
    init(controller: LoginPresenterDelegate) {
        
        super.init()
        self.controller = controller
    }
    
    func login(with username: String, password: String) {
        
        UserRequest.login(with: username, password: password) { (error) in
            
            if error == nil {
                
                self.controller?.showHomeViewController()
            } else {
                
                print(error!.localizedDescription)
            }
        }
    }
    
    func loginWithFacebook() {
        
        UserRequest.loginWithFacebook() { (success, error) in
            
            if success {
                
                self.controller?.showHomeViewController()
            } else if let error = error {
                
                print(error.localizedDescription)
            }
        }
    }
    
}
