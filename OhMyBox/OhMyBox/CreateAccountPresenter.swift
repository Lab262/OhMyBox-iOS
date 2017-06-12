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
    //var accountToCreated = Ac
    
    func setViewDelegate(delegate: CreateAccountDelegate) {
        self.delegate = delegate
    }
    
    func setupFirstStepFieldsData() {
        let nameField = FieldCellData(titleField: "Nome Completo", keyboardType: .default, dataFields: nil, firstStepTypeField: .name)
        
        let emailField = FieldCellData(titleField: "Email", keyboardType: .emailAddress, dataFields: nil, firstStepTypeField: .email)
        
        let birthdateField = FieldCellData(titleField: "Data de Nascimento", keyboardType: .default, dataFields: nil, firstStepTypeField: .birthDate)
        
        let cpfField = FieldCellData(titleField: "CPF", keyboardType: .numberPad, fieldMask: .cpf, text: nil, firstStepTypeField: .cpf)
        
        let phoneField = FieldCellData(titleField: "Telefone", keyboardType: .numberPad, fieldMask: .phone, text: nil, firstStepTypeField: .phone)
        
        fieldsData = [nameField, emailField, birthdateField, cpfField, phoneField]
    }
    
    func setupSecondStepFieldsData() {
        
//        let addressDescriptionField = FieldCellData(titleField: "Endereço", keyboardType: .default, typeField: .addressDescription)
//        let complementField = FieldCellData(titleField: "Complemento", keyboardType: .default, typeField: .addressDescription)
//        let neighborhoodField = FieldCellData(titleField: "Bairro", keyboardType: .default, typeField: .addressNeighborhood)
//        let cepField = FieldCellData(titleField: "CEP", keyboardType: .numberPad, fieldMask: .cep, typeField: .addressCep)
//        let cityField = FieldCellData(titleField: "Cidade", keyboardType: .default, dataFields: ["Gama", "Santa Maria", "Taguatinga"], typeField: .addressCity)
//        let stateField = FieldCellData(titleField: "Estado", keyboardType: .default, dataFields: ["DF", "SP", "RJ"], typeField: .addressState)
//
//        fieldsData = [addressDescriptionField, complementField, neighborhoodField, cepField, cityField, stateField]
    }
    
    func setupThirdStepFieldsData() {
//        let cardNumberField = FieldCellData(titleField: "Número do Cartão", keyboardType: .default, typeField: .addressDescription)
//        
//        let cvvField = FieldCellData(titleField: "CVV", keyboardType: .default, typeField: .addressDescription)
//        
//        let maturityField = FieldCellData(titleField: "Data de Vencimento", keyboardType: .default, typeField: .addressNeighborhood)
//        
//        let cardNameField = FieldCellData(titleField: "Nome do Cartão", keyboardType: .numberPad, fieldMask: .cep, typeField: .addressCep)
//    
//        fieldsData = [cardNumberField, cvvField, maturityField, cardNameField]
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
        case 2: dictionarySecondStepFields[SecondStepField(rawValue: textField.tag)!] = textField as AnyObject
        case 3: dictionaryThirdStepFields[ThirdStepField(rawValue: textField.tag)!] = textField as AnyObject
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
                if let fieldValue = dictionaryFirstStepFields[FirstStepField(rawValue: index)!] as? AKMaskField {
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
    
    func getFieldsDataAndValidate(step: Int) -> Bool{
        
        if step == 1 {
            return getFieldsOfFirstStepAndValidate()
        } else if step == 2 {
            return getFieldsOfSecondStepAndValidate()
        } else {
            return false
        }
    }
    
    
    private func importKeyOfMoip() {
        MoipSDK.importPublicKey(MoipKey.publicKey)
    }
    
   // func createCard(typeField: TypeField, textField: UITextField?, maskField: AKMaskField?) {
        
//        let field = textField ?? maskField
//        
//        switch typeField {
//            
//        case .: self.addressToCreate?.title = field?.text
//        case .addressDescription: self.addressToCreate?.addressDescription = field?.text
//        case .addressNumber: break
//        case .addressState: self.addressToCreate?.city?.state?.name = field?.text
//        case .addressCity: self.addressToCreate?.city?.name = field?.text
//        case .addressReference: self.addressToCreate?.reference = field?.text
//        case .addressNeighbourhood: self.addressToCreate?.neighbourhood = field?.text
//        case .addressCep: self.addressToCreate?.cep = field?.text
//            
//        }
//
//        
//        var creditCard = MPKCreditCard()
//        creditCard.number
//       
//        MPKCreditCard *creditCard = [MPKCreditCard new];
//        creditCard.number = @"4111111111111111";
//        creditCard.cvc = @"999";
//        creditCard.expirationMonth = @"07";
//        creditCard.expirationYear = @"15";
//        
//        NSString * cryptData = [MoipSDK encryptCreditCard:creditCard];
    //}
    
    
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
        case .phone: dictionaryUserPurchaseInformations[UserPurchaseInformations.phone] = field?.text
            
        default: break
            
        }
    }
    
    private func saveSecondStepValue(typeField: SecondStepField, textField: UITextField?, maskField: AKMaskField?) {
      
        let field = textField ?? maskField
        
        switch typeField {
            
        case .addressDescription: dictionaryUserPurchaseInformations[UserPurchaseInformations.addressDescription] = field?.text
        case .addressComplement: dictionaryUserPurchaseInformations[UserPurchaseInformations.addressComplement] = field?.text
        case .addressCep: dictionaryUserPurchaseInformations[UserPurchaseInformations.cep] = field?.text
        case .addressCity: dictionaryUserPurchaseInformations[UserPurchaseInformations.city] = field?.text
        case .addressState: dictionaryUserPurchaseInformations[UserPurchaseInformations.state] = field?.text
            
        default: break
            
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
