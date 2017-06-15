//
//  PurchaseFieldPresenter.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 05/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol PurchaseFieldDelegate {
    func setupTextFieldType(fieldType: TextFieldType)
    func setupTitleField()
}

class PurchaseFieldPresenter: NSObject {
    
    var delegate: PurchaseFieldDelegate?
    
    var fieldCellData: FieldCellData? {
        didSet {
            getFieldCellType()
            self.delegate?.setupTitleField()
        }
    }
    
    func setViewDelegate(delegate: PurchaseFieldDelegate) {
        self.delegate = delegate
    }
    
    func getFieldCellType() {
        if let _ = self.fieldCellData?.fieldMask {
            self.delegate?.setupTextFieldType(fieldType: .mask)
            return
        }
        if let _ = self.fieldCellData?.dataFields {
            self.delegate?.setupTextFieldType(fieldType: .picker)
            return
        }
        
        if let firstStep = self.fieldCellData?.firstStepField {
            if firstStep == .birthDate {
                self.delegate?.setupTextFieldType(fieldType: .datePicker)
                return
            }
        }
        
        if let thirdStep = self.fieldCellData?.thirdStepField {
            if thirdStep == .cardHolderBirthdate {
                self.delegate?.setupTextFieldType(fieldType: .datePicker)
                return
            }
        }
        
        self.delegate?.setupTextFieldType(fieldType: .field)
    }
}
