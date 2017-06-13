//
//  CreateAccountThirdStepViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 08/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import AKMaskField

class CreateAccountThirdStepViewController: UIViewController {

    var presenter = CreateAccountPresenter()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var doneButton: UIButton!
    
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
    
    func setupPresenter() {
        presenter.setViewDelegate(delegate: self)
    }
    
    func setupFields() {
        presenter.setupThirdStepFieldsData()
    }
    
    func setupTableViewInsets() {
        tableView.contentInset = UIEdgeInsetsMake(0, 0, doneButton.frame.height+70, 0)
    }
    
    @IBAction func doneAction(_ sender: Any) {
        if presenter.getFieldsDataAndValidate(step: 3) {
            print ("SUCCESS MANIN")
        }
    }
    
    
}

extension CreateAccountThirdStepViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseFieldTableViewCell.identifier, for: indexPath) as! PurchaseFieldTableViewCell
        
        
        cell.delegate = self
        cell.presenter.fieldCellData = presenter.fieldsData[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.fieldsData.count
    }
}

extension CreateAccountThirdStepViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PurchaseFieldTableViewCell.cellHeight
    }
}

extension CreateAccountThirdStepViewController: FormFieldCellDelegate {
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
        presenter.saveTextInDictionary(step: 3, textField: field!)
    }
    
}

extension CreateAccountThirdStepViewController: CreateAccountDelegate {
    func showMessage(title: String, msg: String) {
        self.present(ViewUtil.alertController(withTitle: title, message: msg), animated: true, completion: nil)
    }
}
