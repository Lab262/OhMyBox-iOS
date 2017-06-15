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
    case cpf = 2
    case phone = 3
    case birthDate = 4
}

enum SecondStepField: Int {
    case addressDescription = 0
    case addressNumber = 1
    case addressComplement = 2
    case addressNeighborhood = 3
    case addressCep = 4
    case addressCity = 5
    case addressState = 6
}


enum ThirdStepField: Int {
    case cardFlag = 0
    case cardName = 1
    case cardNumber = 2
    case cardCvv = 3
    case cardValidity = 4
    case cardHolderFullName = 5
    case cardHolderBirthdate = 6
    case cardHolderCpf = 7
    case cardHolderPhone = 8
}

enum MaskField: String {
    case cpf = "{ddd}.{ddd}.{ddd}.{dd}"
    case phone = "({dd}){ddddd}-{dddd}"
    case card = "{dddd}-{dddd}-{dddd}-{dddd}"
    case validity = "{dd}/{dddd}"
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
    
    init (titleField: String,keyboardType: UIKeyboardType?, fieldMask: MaskField? = nil, text: String? = nil, thirdStepTypeField: ThirdStepField?) {
        self.titleField = titleField
        self.keyboardType = keyboardType
        self.fieldMask = fieldMask
        self.text = text
        self.thirdStepField = thirdStepTypeField
    }
    
    init (titleField: String, keyboardType: UIKeyboardType?, isSecureText: Bool? = false, dataFields: [String]?, text: String? = nil, thirdStepTypeField: ThirdStepField?) {
        self.titleField = titleField
        self.keyboardType = keyboardType
        self.dataFields = dataFields
        self.isSecureText = isSecureText
        self.text = text
        self.thirdStepField = thirdStepTypeField
    }
}
