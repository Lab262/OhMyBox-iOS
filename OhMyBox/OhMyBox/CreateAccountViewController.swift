//
//  CreateAccountViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var buttonSquare: UIView!
    

    @IBAction func registerUser(_ sender: Any) {
        if let msgError = verifyInformations(){
            self.present(ViewUtil.alertController(withTitle: "erroo", message: msgError), animated: true, completion: nil)
            
            return
        }
        
        let user = User(_name: self.nameTextField.text!, _email:self.emailTextField.text!)
        
        UserRequest.createAccountUser(user:user, pass:self.passwordTextField.text!) { (success,msg) in
            if (success){
                
                self.present( self.alertControllerActionWithTitle("Sucesso!!", _withMessage:msg), animated: true, completion: nil)
                
            }else {
                self.present(ViewUtil.alertController(withTitle: "Erro", message: msg), animated: true, completion: nil)
            }
            
            
        }
    }
    
    func verifyInformations() -> String? {
        
        var msgErro: String?
        
        if self.emailTextField.text == nil || self.emailTextField.text == "" {
            
            msgErro = "Email inválido"
            
            return msgErro
        }
        
        if self.passwordTextField.text == nil ||  self.passwordTextField.text == "" {
            
            msgErro = "Senha inválida"
            
            return msgErro
        }
        if self.nameTextField.text == nil || self.nameTextField.text == "" {
            
            msgErro = "Nome inválido"
            
            return msgErro
        }
        return msgErro
        
    }
    
    func alertControllerActionWithTitle (_ _title: String, _withMessage _message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
            //self.present(ViewUtil.viewControllerFromStoryboardWithIdentifier("Main")!, animated: true, completion: nil)
        }))
        return alert
    }
    
    @IBAction func loginWithFacebook(_ sender: AnyObject) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            
            if error == nil {
                self.view.loadAnimation()
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                
                if (result?.isCancelled)! {
                    self.view.unload()
                    return
                }
                
                if(fbloginresult.grantedPermissions.contains("email")) {
                    
                    self.returnUserData()
                    
                }
            } else {
                
            }
            
        }
        
        
        
    }
    func returnUserData(){
        
        if((FBSDKAccessToken.current()) != nil){
            
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                
                if (error == nil) {
                    
                    let data:[String:AnyObject] = result as! [String : AnyObject]
                         let userName = "\(data["first_name"] as! String) \(data["last_name"] as! String)"
                    
                    UserRequest.loginUserWithFacebook(id: data["id"] as! String, email: data["email"] as! String,userName: userName, mediaType:SocialMediaType.facebook.rawValue, completionHandler: { (success, msg, user) in
                        
                        if success {
                            Defaults.sharedInstance.isLogged = true
                            self.present(ViewUtil.viewControllerFromStoryboardWithIdentifier("Main")!, animated: true, completion: nil)
                            
                        }else {
                            self.view.unload()
                            self.present(ViewUtil.alertController(withTitle: "Erro", message: msg), animated: true, completion: nil)
                        }                    })
                    
                }
            })
        }
    }
    
    
    @IBAction func showLogin(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
}

extension CreateAccountViewController:UITextFieldDelegate{
    
    
    
}

//Mark: Animations
extension CreateAccountViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let _ = segue.destination as? LoginViewController {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.alpha = 0
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 1
        })
        self.doBackgroundChangeAnimation()
    }
    
    func doBackgroundChangeAnimation() {
        
        //Author - André Brandão
        UIView.animate(withDuration: 5.0, delay: 0.0, options: .curveEaseInOut, animations: {
            
            if self.buttonSquare.backgroundColor == UIColor.squaresButtonBlueColor {
                
                self.buttonSquare.backgroundColor = UIColor.squaresButtonPinkColor
                
            } else {
                
                self.buttonSquare.backgroundColor = UIColor.squaresButtonBlueColor
            }
            
        }) { (finished) in
            
            if finished {
                self.doBackgroundChangeAnimation()
            }
        }
        
    }
}
