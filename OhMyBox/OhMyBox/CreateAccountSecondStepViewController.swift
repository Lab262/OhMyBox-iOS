//
//  CreateAccountSecondStepViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 07/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import AKMaskField

class CreateAccountSecondStepViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var nextButtonHandler: UIButton.ButtonHandler?
    
    var presenter = CreateAccountPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        setupPresenter()
        setupFields()
        setupTableViewInsets()
    }
    
    func registerNib() {
        tableView.registerNibFrom(PurchaseFieldTableViewCell.self)
    }
    
    func setupTableViewInsets() {
        tableView.contentInset = UIEdgeInsetsMake(0, 0, nextButton.frame.height+70, 0)
    }
    
    func setupPresenter() {
        presenter.setViewDelegate(delegate: self)
    }
    
    func setupFields() {
        presenter.setupSecondStepFieldsData()
    }
    
    @IBAction func nextView(_ sender: Any) {
        nextButtonHandler?(sender as! UIButton)
    }
    
}

extension CreateAccountSecondStepViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseFieldTableViewCell.identifier, for: indexPath) as! PurchaseFieldTableViewCell
        
        cell.presenter.fieldCellData = presenter.fieldsData[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.fieldsData.count
    }
}

extension CreateAccountSecondStepViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PurchaseFieldTableViewCell.cellHeight
    }
}

extension CreateAccountSecondStepViewController: FormFieldCellDelegate {
    func formFieldCellShouldReturn(_ textField: UITextField?, _ maskField: AKMaskField?) -> Bool {
        
        let field = textField ?? maskField
        //self.saveTextInDictionary(textField: field!)
        
        switch field!.returnKeyType {
        case .done:
            self.view.window?.endEditing(true)
            //  self.sendForm()
            
        default: break
            //field!.nextField?.becomeFirstResponder()
        }
        return true
    }
    
    func formFieldCellEndEditing(_ textField: UITextField?, _ maskField: AKMaskField?) {
        let field = textField ?? maskField
        //   self.saveTextInDictionary(textField: field!)
    }
    
}

extension CreateAccountSecondStepViewController: CreateAccountDelegate {
    func showMessage(title: String, msg: String) {
        
    }
}
