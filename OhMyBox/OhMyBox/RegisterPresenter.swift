//
//  RegisterPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 18/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol RegisterView: class {
    
    var textFields: [UITextField] {get}
    
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
    
    func verifiedInformations() throws -> (firstName: String, lastName: String, email: String, password: String) {
        
        let firstName = view.textFields[1].text!
        let lastName = view.textFields[2].text!
        let email = view.textFields[3].text!
        let password = view.textFields[4].text!
        let passwordConfirmation = view.textFields[5].text!
        
        guard firstName.length > 0 && lastName.length > 0 else {
            
            throw RegisterError.invalidName
        }
        
        guard email.isValidEmail else {
            
            throw RegisterError.invalidEmail
        }
        
        guard password.length > 2 && password == passwordConfirmation else {
            
            throw RegisterError.invalidPassword
        }
        
        return (firstName, lastName, email, password)
    }
    
}
