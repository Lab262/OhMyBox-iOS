//
//  LoginViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

let KEY_EMAIL = "email"
let KEY_PASS = "pass"
let KEY_CONFIRM_PASS = "confirmationPass"
class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    var dictionaryTextFields = Dictionary <String, String>()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginApp(_ sender: AnyObject) {
        
        if let msgError = self.verifyInformations() {
            
            self.present(ViewUtil.alertControllerWithTitle(_title: "Erro", _withMessage: msgError), animated: true, completion: nil)
            
          
            return
        }
        self.getRequestLogin()
    }
    
    
    func verifyInformations() -> String? {
        self.getFields()
        var msgErro: String?
        
        if self.dictionaryTextFields[KEY_EMAIL] == nil || self.dictionaryTextFields[KEY_EMAIL] == "" {
            
            msgErro = "Email inválido"
            
            return msgErro
        }
        
        if self.dictionaryTextFields[KEY_PASS] == nil || self.dictionaryTextFields[KEY_PASS] == "" {
            
            msgErro = "Senha inválida"
            
            return msgErro
        }
        
        return msgErro
        
    }
    
    func getFields(){
        self.view.endEditing(true)
        self.dictionaryTextFields[KEY_PASS] = passwordTextField.text
        self.dictionaryTextFields[KEY_EMAIL] = loginTextField.text
    }
    
    func getRequestLogin(){
        self.view.endEditing(true)
        UserRequest.loginUser(email:loginTextField.text!, pass:passwordTextField.text!) { (sucess,msg, user) in
            if (sucess){
                  self.present( self.alertControllerActionWithTitle("Seja bem vindo!", _withMessage:msg), animated: true, completion: nil)
            }else{
                self.present(ViewUtil.alertControllerWithTitle(_title: "Erro", _withMessage:msg), animated: true, completion: nil)

            }
            
            
        }
    }
    
    func alertControllerActionWithTitle (_ _title: String, _withMessage _message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
             self.present(ViewUtil.viewControllerFromStoryboardWithIdentifier("Main")!, animated: true, completion: nil)
            Defaults.sharedInstance.isLogged = true
        }))
        return alert
    }
    
}
