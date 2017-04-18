//
//  LoginViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit
import Parse
import ParseFacebookUtilsV4

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenter!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var buttonSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = LoginPresenter(view: self)
    }
    
    @IBAction func loginAction(_ sender: AnyObject) {
        
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        presenter.login(with: username, password: password)
    }
    
    @IBAction func loginWithFacebookAction(_ sender: AnyObject) {
        
        presenter.loginWithFacebook()
    }
    
}

// MARK: Login view MVP
extension LoginViewController: LoginView {
    
    func didFinishLogin(_ success: Bool, error: Error?) {
        
        if success {
            
            DispatchQueue.main.async {
                
                let vc = ViewUtil.viewControllerFromStoryboardWithIdentifier("Main")!
                self.present(vc, animated: true, completion: nil)
            }
        } else {
            
            // feedback
        }
    }
}

// MARK: Animations
extension LoginViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let _ = segue.destination as? RegisterViewController {
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

