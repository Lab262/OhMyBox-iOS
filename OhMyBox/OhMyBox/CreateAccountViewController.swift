//
//  CreateAccountViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonSquare: UIView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        registerNibs()
    }
    
    func registerNibs() {
        
        tableView.registerNibFrom(LogoTableViewCell.self)
        tableView.registerNibFrom(RegisterFieldTableViewCell.self)
    }
    
    @IBAction func registerUser(_ sender: Any) {
        
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

extension CreateAccountViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        switch indexPath.row {
        case 0: cell = generateLogoCell(tableView, cellForRowAt: indexPath)
        default: cell = generateRegisterFieldCell(tableView, cellForRowAt: indexPath)
        }
        
        return cell
    }
}

extension CreateAccountViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        switch indexPath.row {
            
        case 0: height = LogoTableViewCell.cellHeight
        default: height = RegisterFieldTableViewCell.cellHeight
        }
        
        return height
    }
}

// MARK: - Cells generation
extension CreateAccountViewController {
    
    func generateLogoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> LogoTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LogoTableViewCell.identifier) as! LogoTableViewCell
        
        return cell
    }
    
    func generateRegisterFieldCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> RegisterFieldTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RegisterFieldTableViewCell.identifier) as! RegisterFieldTableViewCell
        
        switch indexPath.row {
            
        case 1, 2:
            cell.iconImageView.image = #imageLiteral(resourceName: "iconUser_image")
        case 3:
            cell.iconImageView.image = #imageLiteral(resourceName: "iconEmail_image")
            cell.textField.keyboardType = .emailAddress
        case 4, 5:
            cell.iconImageView.image = #imageLiteral(resourceName: "iconPass_image")
            cell.textField.isSecureTextEntry = true
        default: break
        }
        
        cell.textField.placeholder = registerFieldPlaceholder(for: indexPath.row)
        
        return cell
    }
    
    func registerFieldPlaceholder(for index: Int) -> String {
        
        let placeholder: String
        switch index {
            
        case 1: placeholder = "Nome"
        case 2: placeholder = "Sobrenome"
        case 3: placeholder = "Email"
        case 4: placeholder = "Senha"
        case 5: placeholder = "Confirmar senha"
        default: placeholder = ""
        }
        
        return placeholder
    }
}


