//
//  RegisterViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
// MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonSquare: UIView!

    var textFields: [UITextField] = [] {
        didSet {
            textFields = textFields.sorted {
                
                return $0.tag < $1.tag
            }
        }
    }
    
// MARK: - Properties
    
    var presenter: RegisterPresenter!
    
// MARK: - Default initialization methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        presenter = RegisterPresenter(view: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidAppear(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidDisappear(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        registerNibs()
    }
    
    func keyboardDidAppear(_ notification: Notification) {
        
        let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.size
        
        tableView.contentInset.bottom = keyboardSize.height
    }
    
    func keyboardDidDisappear(_ notification: Notification) {
        
        let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.size
        
        tableView.contentInset.bottom = 0
    }
    
    func registerNibs() {
        
        tableView.registerNibFrom(LogoTableViewCell.self)
        tableView.registerNibFrom(RegisterFieldTableViewCell.self)
    }
    
// MARK: - Actions
    
    @IBAction func registerUser(_ sender: Any) {
        
        let user = User()
        
        do {
            
            let verifiedInfo = try presenter.verifiedInformations()
            
            user.firstName = verifiedInfo.firstName
            user.lastName = verifiedInfo.lastName
            user.email = verifiedInfo.email
            
            presenter.registerUser(user, password: verifiedInfo.password)
            
        } catch let error as RegisterError {
            
            showErrorAlert(message: error.message)
        } catch {
            
            showErrorAlert(message: "Erro desconhecido")
        }
    }
    
    @IBAction func loginWithFacebook(_ sender: AnyObject) {
        
        presenter.loginWithFacebook()
    }
    
    @IBAction func showLogin(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
// MARK: - Alert methods
    
    func showErrorAlert(message: String? = nil) {
        
        showAlert(with: "Erro :(", message: message ?? "Não foi possível criar a conta", handler: nil)
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
    
}

// MARK: - Animations

extension RegisterViewController {
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

// MARK: - Tableview set up
extension RegisterViewController: UITableViewDataSource {
    
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

extension RegisterViewController: UITableViewDelegate {
    
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
extension RegisterViewController {
    
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
        
        cell.textField.tag = indexPath.row
        cell.textField.delegate = self
        cell.textField.returnKeyType = indexPath.row == 5 ? .done : .next
        
        textFields.append(cell.textField)
        
        
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

// MARK: - Register view MVP

extension RegisterViewController: RegisterView {
    
    func didRegister(withSuccess success: Bool, message: String) {
        
        if success {
            
            showSuccessAlert()
        } else {
            
            showErrorAlert()
        }
    }
    
    func didFinishLoginWithFacebook(_ success: Bool, error: Error?) {
        
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

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let index = textFields.index(of: textField) else { return true }
        if let next = textFields.object(at: index + 1) {
            
            next.becomeFirstResponder()
        } else {
            
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        guard let index = textFields.index(of: textField) else { return }
        
        let indexPath = IndexPath(row: index + 1, section: 0)
        
        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
    }
}

