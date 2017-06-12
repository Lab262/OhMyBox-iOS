//
//  PurchaseFieldTableViewCell.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 03/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import AKMaskField
import SnapKit

enum TextFieldType {
    case mask
    case field
    case picker
}

protocol FormFieldCellDelegate {
    func formFieldCellShouldReturn(_ textField: UITextField?, _ maskField: AKMaskField?) -> Bool
    func formFieldCellEndEditing(_ textField: UITextField?, _ maskField: AKMaskField?)
}

class PurchaseFieldTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return "purchaseFieldCell"
    }
    
    static var cellHeight: CGFloat {
        return 80.0
    }
    
    static var nibName: String {
        return "PurchaseFieldTableViewCell"
    }
    
    @IBOutlet weak var titleFieldLabel: UILabel!
    
    var textField: UITextField?
    var maskField: AKMaskField?
    var pickerView: UIPickerView?
    var delegate: FormFieldCellDelegate?
    var presenter: PurchaseFieldPresenter = PurchaseFieldPresenter()
    var bottomView: UIView?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTitleFieldConstraint()
        setupViewDelegate()
    }
    
    fileprivate func setupViewDelegate() {
        presenter.setViewDelegate(delegate: self)
    }
    
    fileprivate func setupTitleFieldConstraint() {
        titleFieldLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.contentView).offset(15)
            make.top.equalTo(self.contentView).offset(15)
            make.right.equalTo(self.contentView).offset(-15)
        })
    }
    
    fileprivate func setupTextField() {
        textField = UITextField()
        textField?.delegate = self
        textField?.keyboardType = presenter.fieldCellData!.keyboardType!
        
        if let _ = presenter.fieldCellData?.firstStepField {
            textField?.tag = presenter.fieldCellData!.firstStepField!.rawValue
        }
        
        
        if let text = presenter.fieldCellData?.text {
            self.textField!.text = text
        }
        
        self.contentView.addSubview(textField!)
    }
    
    fileprivate func setupMaskField(){
        maskField = AKMaskField()
        
        
        if let _ = presenter.fieldCellData?.firstStepField {
            maskField?.tag = presenter.fieldCellData!.firstStepField!.rawValue
        }
        maskField?.setMask(presenter.fieldCellData!.fieldMask!.rawValue, withMaskTemplate: "")
        maskField?.keyboardType = presenter.fieldCellData!.keyboardType!
        
        if let text = presenter.fieldCellData?.text {
            self.maskField!.text = text
        }
    
        maskField?.maskDelegate = self
        
        self.contentView.addSubview(maskField!)
    }
    
    fileprivate func setupPicker() {
        pickerView = UIPickerView()
        pickerView!.delegate = self
        pickerView!.dataSource = self
        textField!.inputView = self.pickerView
        textField!.delegate = self
    }
    
    fileprivate func setupConstraintField(fieldType: TextFieldType) {
        let field = fieldType == .mask ? maskField : textField
        field?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.contentView).offset(15)
            make.height.equalTo(self.contentView).multipliedBy(0.3)
            make.bottom.equalTo(self.contentView).offset(-5)
            make.right.equalTo(self.contentView).offset(-15)
        })
    }
    
    fileprivate func setupBottomViewConstraint() {
        bottomView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.contentView).offset(15)
            make.height.equalTo(self.contentView).multipliedBy(0.005)
            make.bottom.equalTo(self.contentView).offset(-2)
            make.right.equalTo(self.contentView).offset(-15)
        })
    }
    
    fileprivate func setupToolbarAccessory(){
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.textField!.frame.width, height: 44))
        let doneButton = UIBarButtonItem(title: "Ok", style: .done, target: self, action:#selector(resignTextField(_:)))
        let flexible: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexible, doneButton], animated: false)
        textField!.inputAccessoryView = toolbar
    }
    
    fileprivate func setupViewBottomLine(fieldType: TextFieldType) {
        let field = fieldType == .mask ? maskField : textField
        bottomView = UIView(frame: CGRect(x: 0, y: 0, width: field!.frame.width, height: field!.frame.height))
        bottomView?.backgroundColor = UIColor.colorWithHexString("241932")
        contentView.addSubview(bottomView!)
    }
    
    func resignTextField (_ sender: UIButton) {
        self.textField!.resignFirstResponder()
    }
}

extension PurchaseFieldTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter.fieldCellData!.dataFields!.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return presenter.fieldCellData!.dataFields?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textField!.text = presenter.fieldCellData!.dataFields?[row]
        
    }
}

extension PurchaseFieldTableViewCell:UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let shouldReturn = self.delegate?.formFieldCellShouldReturn(textField, nil) {
            self.presenter.fieldCellData?.text = textField.text
            return shouldReturn
        } else {
            return false
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let _ = presenter.fieldCellData?.dataFields {
            if textField.text == "" {
                self.textField!.text = presenter.fieldCellData?.dataFields?.first
            } else {
                if let textData = presenter.fieldCellData?.text {
                    for (index, text) in presenter.fieldCellData!.dataFields!.enumerated() {
                        if textData == text {
                            self.pickerView?.selectRow(index, inComponent: 0, animated: true)
                            self.textField!.text = text
                        }
                    }
                }
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.delegate?.formFieldCellEndEditing(textField, nil)
    }
}

extension PurchaseFieldTableViewCell: AKMaskFieldDelegate {
    
    func maskFieldShouldReturn(_ maskField: AKMaskField) -> Bool {
        if let shouldReturn = self.delegate?.formFieldCellShouldReturn(nil, maskField){
            return shouldReturn
        } else {
            return false
        }
    }
    
    func maskFieldDidEndEditing(_ maskField: AKMaskField) {
        self.delegate?.formFieldCellEndEditing(nil, maskField)
    }
}

extension PurchaseFieldTableViewCell: PurchaseFieldDelegate {
    func setupTextFieldType(fieldType: TextFieldType) {
        switch fieldType {
        case .mask:
            setupMaskField()
        case .field:
            setupTextField()
        case .picker:
            setupTextField()
            setupPicker()
            setupToolbarAccessory()
        }
        setupViewBottomLine(fieldType: fieldType)
        setupConstraintField(fieldType: fieldType)
        setupBottomViewConstraint()
    }
    
    func setupTitleField() {
        titleFieldLabel.text = presenter.fieldCellData!.titleField
    }
}


