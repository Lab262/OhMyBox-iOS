//
//  FieldCellData.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 03/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

enum FirstStepField: Int {
    case name = 0
    case email = 1
    case birthDate = 2
    case cpf = 3
    case phone = 4
}

enum SecondStepField: Int {
    case addressDescription = 0
    case addressComplement = 1
    case addressNeighborhood = 2
    case addressCep = 3
    case addressCity = 4
    case addressState = 5
}


enum ThirdStepField: Int {
    case cardFlag = 0
    case cardName = 1
    case cardNumber = 2
    case cardValidity = 3
    case cardCvv = 4
    case cardMaturity = 5
}

enum MaskField: String {
    case cpf = "{ddd}.{ddd}.{ddd}.{dd}"
    case phone = "({dd}){ddddd}-{dddd}"
    case card = "{dddd}-{dddd}-{dddd}-{dddd}"
    case validity = "{dd}/{dd}"
    case cvv = "{ddd}"
    case cep = "{ddddd}-{ddd}"
}

enum PaymentMethod: String {
    case visa = "VISA"
    case mastercard = "MASTERCARD"
    case americanExpress = "AMERICAN EXPRESS"
    case aura = "AURA"
    case diners = "DINERS"
    case hipercard = "HIPERCARD"
    case elo = "ELO"
    
    static let allValues = [visa, mastercard, americanExpress, diners, hipercard, elo]
}


class FieldCellData: NSObject {
    
    var titleField: String!
    var text: String?
    var placeholder: String?
    var keyboardType: UIKeyboardType?
    var fieldMask: MaskField?
    var isSecureText: Bool?
    var dataFields: [String]?
    var firstStepField: FirstStepField?
    var secondStepField: SecondStepField?
    var thirdStepField: ThirdStepField?
    
    init (titleField: String,keyboardType: UIKeyboardType?, fieldMask: MaskField? = nil, text: String? = nil, firstStepTypeField: FirstStepField?) {
        self.titleField = titleField
        self.keyboardType = keyboardType
        self.fieldMask = fieldMask
        self.text = text
        self.firstStepField = firstStepTypeField
    }
    
    init (titleField: String, keyboardType: UIKeyboardType?, isSecureText: Bool? = false, dataFields: [String]?, text: String? = nil, firstStepTypeField: FirstStepField?) {
        self.titleField = titleField
        self.keyboardType = keyboardType
        self.dataFields = dataFields
        self.isSecureText = isSecureText
        self.text = text
        self.firstStepField = firstStepTypeField
    }
    
    init (titleField: String,keyboardType: UIKeyboardType?, fieldMask: MaskField? = nil, text: String? = nil, secondStepTypeField: SecondStepField?) {
        self.titleField = titleField
        self.keyboardType = keyboardType
        self.fieldMask = fieldMask
        self.text = text
        self.secondStepField = secondStepTypeField
    }
    
    init (titleField: String, keyboardType: UIKeyboardType?, isSecureText: Bool? = false, dataFields: [String]?, text: String? = nil, secondStepTypeField: SecondStepField?) {
        self.titleField = titleField
        self.keyboardType = keyboardType
        self.dataFields = dataFields
        self.isSecureText = isSecureText
        self.text = text
        self.secondStepField = secondStepTypeField
    }
}
