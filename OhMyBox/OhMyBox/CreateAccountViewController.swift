//
//  CreateAccountViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var buttonSquare: UIView!

    @IBAction func registerUser(_ sender: Any) {
        
        if verifyInformations() == nil {
            
            let user = User()
            user.firstName = nameTextField.text
            user.email = emailTextField.text
            
            UserRequest.create(user: user, password: passwordTextField.text!) { (success, message) in
                
                if success {
                    self.showSuccessAlert()
                } else {
                    self.showErrorAlert()
                }
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
    
    func showErrorAlert() {
        
        showAlert(with: "Erro :(", message: "Não foi possível criar a conta", handler: nil)
    }
    
    func showSuccessAlert() {
        
        showAlert(with: "Sucesso!", message: "Conta criada com sucesso", handler: alertSuccessHandler)
    }
    
    func showAlert(with title: String, message: String, handler: (() -> ())?) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        alertController.title = title
        alertController.message = message
        
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            handler?()
        }
        
        alertController.addAction(action)
        
        DispatchQueue.main.async {
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func alertSuccessHandler() {
        
        self.present(ViewUtil.viewControllerFromStoryboardWithIdentifier("Main")!, animated: true, completion: nil)
    }
    
    @IBAction func loginWithFacebook(_ sender: AnyObject) {
        
    }
    
    @IBAction func showLogin(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
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
