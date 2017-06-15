//
//  CreateAccountPresenter.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 03/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import AKMaskField
import MoipEncryptSDK



protocol CreateAccountDelegate {
    func showMessage(title: String, msg: String)
}

class CreateAccountPresenter: NSObject {
    
    var fieldsData = [FieldCellData]()
    
    private var dictionaryFirstStepFields = Dictionary<FirstStepField, AnyObject>()
    private var dictionarySecondStepFields = Dictionary<SecondStepField, AnyObject>()
    private var dictionaryThirdStepFields = Dictionary<ThirdStepField, AnyObject>()
    
    private var dictionaryUserPurchaseInformations = Dictionary<String, String>()
    
    var delegate: CreateAccountDelegate?
    var purchaseRequest: PurchaseRequest?
    private var creditCard: MPKCreditCard!
    
    func setViewDelegate(delegate: CreateAccountDelegate) {
        self.delegate = delegate
    }
    
    
    func setupFirstStepFieldsData() {
        let nameField = FieldCellData(titleField: "Nome Completo", keyboardType: .default, dataFields: nil, firstStepTypeField: .name)
        
        let emailField = FieldCellData(titleField: "Email", keyboardType: .emailAddress, dataFields: nil, firstStepTypeField: .email)
        
        let birthdateField = FieldCellData(titleField: "Data de Nascimento", keyboardType: .default, dataFields: nil, firstStepTypeField: .birthDate)
        
        let cpfField = FieldCellData(titleField: "CPF", keyboardType: .numberPad, fieldMask: .cpf, text: nil, firstStepTypeField: .cpf)
        
        let phoneField = FieldCellData(titleField: "Telefone", keyboardType: .numberPad, fieldMask: .phone, text: nil, firstStepTypeField: .phone)
        
        fieldsData = [nameField, birthdateField, emailField, cpfField, phoneField]
    }
    
    func setupSecondStepFieldsData() {
        let addressDescriptionField = FieldCellData(titleField: "Endereço", keyboardType: .default, dataFields: nil, secondStepTypeField: .addressDescription)
        
        let addressNumberField = FieldCellData(titleField: "Número", keyboardType: .numberPad, dataFields: nil, secondStepTypeField: .addressNumber)
        
        let complementField = FieldCellData(titleField: "Complemento", keyboardType: .default, dataFields: nil, secondStepTypeField: .addressComplement)
        
        let neighborhoodField = FieldCellData(titleField: "Bairro", keyboardType: .default, dataFields: nil, secondStepTypeField: .addressNeighborhood)
        
        let cepField = FieldCellData(titleField: "CEP", keyboardType: .numberPad, fieldMask: .cep, secondStepTypeField: .addressCep)
        
        let cityField = FieldCellData(titleField: "Cidade", keyboardType: .default, dataFields: ["Brasilia", "Santa Maria", "Taguatinga"], secondStepTypeField: .addressCity)
        
        let stateField = FieldCellData(titleField: "Estado", keyboardType: .default, dataFields: ["DF", "SP", "RJ"], secondStepTypeField: .addressState)
        
        fieldsData = [addressDescriptionField, addressNumberField, complementField, neighborhoodField, cepField, cityField, stateField]
    }
    
    private func getFlags() -> [String] {
        var paymentMethods = [String]()
        
        for method in PaymentMethod.allValues {
            paymentMethods.append(method.rawValue)
        }
        return paymentMethods
    }
    
    func createAccountWithOrder() {
        CreateAccountRequest.buyBox(userInformations: dictionaryUserPurchaseInformations, purchaseRequest: purchaseRequest!, card: creditCard) { (success, msg) in
            if success {
                
            }
        }
    }
    
    func setupThirdStepFieldsData() {
        
        initializeCreditCard()
        
        let cardFlagField = FieldCellData(titleField: "Bandeira", keyboardType: .default, dataFields: getFlags(), thirdStepTypeField: .cardFlag)
        
        let cardNameField = FieldCellData(titleField: "Nome", keyboardType: .default, thirdStepTypeField: .cardName)
        
        let cardNumberField = FieldCellData(titleField: "Número do cartão", keyboardType: .numberPad, fieldMask: .card, thirdStepTypeField: .cardNumber)
        
        let cvvField = FieldCellData(titleField: "CVC", keyboardType: .numberPad, fieldMask: .cvv, thirdStepTypeField: .cardCvv)
        
        let validityField = FieldCellData(titleField: "Validade", keyboardType: .numberPad, fieldMask: .validity, thirdStepTypeField: .cardValidity)
        
        let holderNameField = FieldCellData(titleField: "Nome do dono do cartão", keyboardType: .default,  thirdStepTypeField: .cardHolderFullName)
        
        let holderBirthdateField = FieldCellData(titleField: "Data de nascimento do dono do cartão", keyboardType: .default,  thirdStepTypeField: .cardHolderBirthdate)
        
        let holderCpfField = FieldCellData(titleField: "CPF do dono do cartão", keyboardType: .numberPad, fieldMask: .cpf, thirdStepTypeField: .cardHolderCpf)
        
        let holderPhoneField = FieldCellData(titleField: "Telefone do dono do cartão", keyboardType: .numberPad, fieldMask: .phone, thirdStepTypeField: .cardHolderPhone)
    
        
        fieldsData = [cardFlagField, cardNameField, cardNumberField, cvvField, validityField, holderNameField, holderBirthdateField, holderCpfField, holderPhoneField]
    }
    
    func initializeCreditCard() {
        importKeyOfMoip()
        creditCard = MPKCreditCard()
    }
    
    func saveTextInDictionary(step: Int, textField:UITextField){
        switch step {
        case 1: dictionaryFirstStepFields[FirstStepField(rawValue: textField.tag)!] = textField as AnyObject
        case 2: dictionarySecondStepFields[SecondStepField(rawValue: textField.tag)!] = textField as AnyObject
        case 3: dictionaryThirdStepFields[ThirdStepField(rawValue: textField.tag)!] = textField as AnyObject
        default:break
        }
        
        saveTextInFieldData(step: step, textField: textField)
    }
    
    func saveTextInFieldData(step: Int, textField: UITextField) {
        switch step {
        case 1:
            for f in fieldsData where f.firstStepField == FirstStepField(rawValue: textField.tag) {
                f.text = textField.text
            }
        case 2:
            for f in fieldsData where f.secondStepField == SecondStepField(rawValue: textField.tag) {
                f.text = textField.text
            }
        case 3:
            for f in fieldsData where f.thirdStepField == ThirdStepField(rawValue: textField.tag) {
                f.text = textField.text
            }
        default:break
        }
        
    }
    
    
    private func getFieldsOfFirstStepAndValidate() -> Bool {
        for (index, fieldCell) in self.fieldsData.enumerated() {
            if let field = dictionaryFirstStepFields[FirstStepField(rawValue: index)!] {
                if let fieldValue = field as? UITextField {
                    if self.checkFieldIsEmpty(field: fieldValue) {
                        self.errorAlertByFieldData(fieldData: fieldCell)
                        return false
                    }
                }
                if let fieldValue = dictionaryFirstStepFields[FirstStepField(rawValue: index)!] as? AKMaskField {
                    if self.checkMaskFieldIsEmpty(field: fieldValue) {
                        self.errorAlertByFieldData(fieldData: fieldCell)
                        return false
                    }
                }
                self.saveFirstStepValue(typeField: FirstStepField(rawValue:index)!, textField: field as? UITextField, maskField: field as? AKMaskField)
            } else {
                self.errorAlertByFieldData(fieldData: fieldCell)
                return false
            }
        }
        
        return true
    }
    
    private func getFieldsOfSecondStepAndValidate() -> Bool {
        for (index, fieldCell) in self.fieldsData.enumerated() {
            if let field = dictionarySecondStepFields[SecondStepField(rawValue: index)!] {
                if let fieldValue = field as? UITextField {
                    if self.checkFieldIsEmpty(field: fieldValue) {
                        self.errorAlertByFieldData(fieldData: fieldCell)
                        return false
                    }
                }
                if let fieldValue = dictionarySecondStepFields[SecondStepField(rawValue: index)!] as? AKMaskField {
                    if self.checkMaskFieldIsEmpty(field: fieldValue) {
                        self.errorAlertByFieldData(fieldData: fieldCell)
                        return false
                    }
                }
                self.saveSecondStepValue(typeField: SecondStepField(rawValue:index)!, textField: field as? UITextField, maskField: field as? AKMaskField)
            } else {
                self.errorAlertByFieldData(fieldData: fieldCell)
                return false
            }
        }
        
        return true
    }
    
    private func getFieldsOfThirdStepAndValidate() -> Bool {
        for (index, fieldCell) in self.fieldsData.enumerated() {
            if let field = dictionaryThirdStepFields[ThirdStepField(rawValue: index)!] {
                if let fieldValue = field as? UITextField {
                    if self.checkFieldIsEmpty(field: fieldValue) || !self.checkInformationsCard(typeField: ThirdStepField(rawValue:index)!, textField: field as? UITextField, maskField: field as? AKMaskField) {
                        self.errorAlertByFieldData(fieldData: fieldCell)
                        return false
                    }
                }
                if let fieldValue = dictionaryThirdStepFields[ThirdStepField(rawValue: index)!] as? AKMaskField {
                    if self.checkMaskFieldIsEmpty(field: fieldValue) || !self.checkInformationsCard(typeField: ThirdStepField(rawValue:index)!, textField: field as? UITextField, maskField: field as? AKMaskField) {
                        self.errorAlertByFieldData(fieldData: fieldCell)
                        return false
                    }
                }
                self.saveThirdStepValue(typeField: ThirdStepField(rawValue:index)!, textField: field as? UITextField, maskField: field as? AKMaskField)
            } else {
                self.errorAlertByFieldData(fieldData: fieldCell)
                return false
            }
        }
        
        return true
    }
    
    func getFieldsDataAndValidate(step: Int) -> Bool{
        if step == 1 {
            return getFieldsOfFirstStepAndValidate()
        } else if step == 2 {
            return getFieldsOfSecondStepAndValidate()
        } else {
            return getFieldsOfThirdStepAndValidate()
        }
    }
    
    private func checkInformationsCard(typeField: ThirdStepField, textField: UITextField?, maskField: AKMaskField?) -> Bool {
        
        let field = textField ?? maskField
        
        switch typeField {
        case .cardNumber:
            creditCard.number = field!.text?.replacingOccurrences(of: "-", with: "", options: .literal, range:nil)
            return creditCard.isNumberValid()
        case .cardCvv:
            creditCard.cvc = field!.text
            return creditCard.isSecurityCodeValid()
        case .cardValidity:
            let validity = field!.text?.replacingOccurrences(of: "-", with: "", options: .literal, range:nil)
            creditCard.expirationMonth = String(validity!.characters.prefix(2))
            creditCard.expirationYear = String(validity!.characters.suffix(4))
            
            return creditCard.isExpiryDateValid()
            
        default: return true
        }
    }
    
    private func importKeyOfMoip() {
        MoipSDK.importPublicKey(MoipKey.publicKey)
    }
    
    private func encryptCard() -> String {
        let cryptData = MoipSDK.encryptCreditCard(creditCard)
        return cryptData!
    }
    private func errorAlertByFieldData(fieldData: FieldCellData) {
        let msgError = "Campo " + fieldData.titleField.lowercased() + " inválido."
        
        self.delegate?.showMessage(title: "Atenção", msg: msgError)
    }
    
    private func checkFieldIsEmpty(field: UITextField) -> Bool {
        if field.text == "" {
            return true
        }
        return false
    }
    
    private func saveFirstStepValue(typeField: FirstStepField, textField: UITextField?, maskField: AKMaskField?) {
        
        let field = textField ?? maskField
        
        switch typeField {
            
        case .name: dictionaryUserPurchaseInformations[UserPurchaseInformations.name] = field?.text
        case .email: dictionaryUserPurchaseInformations[UserPurchaseInformations.email] = field?.text
        case .birthDate: dictionaryUserPurchaseInformations[UserPurchaseInformations.birthdate] = field?.text
        case .cpf: dictionaryUserPurchaseInformations[UserPurchaseInformations.cpf] = field?.text?.replacingOccurrences(of: "[|.-]", with: "", options: .literal, range:nil)
        case .phone: dictionaryUserPurchaseInformations[UserPurchaseInformations.phone] = field?.text?.replacingOccurrences(of: "[ |()-]", with: "", options: [.regularExpression])
        }
    }
    
    private func saveSecondStepValue(typeField: SecondStepField, textField: UITextField?, maskField: AKMaskField?) {
      
        let field = textField ?? maskField
        
        switch typeField {
        case .addressDescription: dictionaryUserPurchaseInformations[UserPurchaseInformations.addressDescription] = field?.text
        case .addressNumber: dictionaryUserPurchaseInformations[UserPurchaseInformations.addressNumber] = field?.text
        case .addressComplement: dictionaryUserPurchaseInformations[UserPurchaseInformations.addressComplement] = field?.text
        case .addressCep: dictionaryUserPurchaseInformations[UserPurchaseInformations.cep] = field?.text?.replacingOccurrences(of: "-", with: "", options: .literal, range:nil)
        case .addressCity: dictionaryUserPurchaseInformations[UserPurchaseInformations.city] = field?.text
        case .addressState: dictionaryUserPurchaseInformations[UserPurchaseInformations.state] = field?.text
        default: break
            
        }
    }
    
    private func saveThirdStepValue(typeField: ThirdStepField, textField: UITextField?, maskField: AKMaskField?) {
        
        let field = textField ?? maskField
        
        switch typeField {
        case .cardFlag: dictionaryUserPurchaseInformations[UserPurchaseInformations.cardFlag] = field?.text
        case .cardName: dictionaryUserPurchaseInformations[UserPurchaseInformations.cardName] = field?.text
        case .cardNumber: dictionaryUserPurchaseInformations[UserPurchaseInformations.cardNumber] = field?.text
        case .cardCvv: dictionaryUserPurchaseInformations[UserPurchaseInformations.cardCvv] = field?.text
        case .cardValidity: dictionaryUserPurchaseInformations[UserPurchaseInformations.cardValidity] = field?.text
        case .cardHolderFullName: dictionaryUserPurchaseInformations[UserPurchaseInformations.cardHolderFullName] = field?.text
        case .cardHolderBirthdate: dictionaryUserPurchaseInformations[UserPurchaseInformations.cardHolderBirthdate] = field?.text
        case .cardHolderCpf: dictionaryUserPurchaseInformations[UserPurchaseInformations.cardHolderCpf] = field?.text?.replacingOccurrences(of: "[|.-]", with: "", options: .literal, range:nil)
        case .cardHolderPhone: dictionaryUserPurchaseInformations[UserPurchaseInformations.cardHolderPhone] = field?.text
        }
        
    }
    
    private func checkMaskFieldIsEmpty(field: AKMaskField) -> Bool {
        switch field.maskStatus{
        case .clear, .incomplete:
            return true
        default:
            return false
        }
    }
}
