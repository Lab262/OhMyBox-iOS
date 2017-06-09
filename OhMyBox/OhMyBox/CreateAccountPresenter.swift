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
    
    var delegate: CreateAccountDelegate?
    //var accountToCreated = Ac
    
    func setViewDelegate(delegate: CreateAccountDelegate) {
        self.delegate = delegate
    }
    
    func setupFirstStepFieldsData() {
        
//        let nameField = FieldCellData(titleField: "Nome completo", keyboardType: .default, typeField: TypeField.name)
//        let emailField = FieldCellData(titleField: "Email", keyboardType: .emailAddress, typeField: .email)
//        let birthdateField = FieldCellData(titleField: "Data de Nascimento", keyboardType: .default, typeField: .birthDate)
//        let cpfField = FieldCellData(titleField: "CPF", keyboardType: .numberPad, fieldMask: .cpf, typeField: .cpf)
//        let phoneField = FieldCellData(titleField: "Telefone", keyboardType: .numberPad, fieldMask: .phone, typeField: .phone)
//        
//        fieldsData = [nameField, emailField, birthdateField, cpfField, phoneField]
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
    
    func saveTextInDictionary(textField:UITextField){
       // dictionaryFields[TypeField(rawValue: textField.tag)!] = textField as AnyObject
    }
    
    private func getFieldsDataAndValidate() -> Bool{
//        for (index, fieldCell) in self.fieldsData.enumerated() {
//            if let field = dictionaryFields[TypeField(rawValue: index)!] {
//                if let fieldValue = field as? UITextField {
//                    if self.checkFieldIsEmpty(field: fieldValue) {
//                        self.errorAlertByFieldData(fieldData: fieldCell)
//                        return false
//                    }
//                }
//                if let fieldValue = dictionaryFields[TypeField(rawValue: index)!] as? AKMaskField {
//                    if self.checkMaskFieldIsEmpty(field: fieldValue) {
//                        self.errorAlertByFieldData(fieldData: fieldCell)
//                        return false
//                    }
//                }
//                
//               // self.saveFieldValue(typeField: TypeField(rawValue: index)!, textField: field as? UITextField, maskField: field as? AKMaskField)
//                
//            } else {
//                self.errorAlertByFieldData(fieldData: fieldCell)
//                return false
//            }
//        }
        
        return true
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
    
    
    func errorAlertByFieldData(fieldData: FieldCellData) {
        let msgError = "Campo " + fieldData.titleField.lowercased() + " inválido."
        
        self.delegate?.showMessage(title: "Atenção", msg: msgError)
    }
    
    func checkFieldIsEmpty(field: UITextField) -> Bool {
        if field.text == "" {
            return true
        }
        return false
    }
    
//    func saveFieldValue(typeField: TypeField, textField: UITextField?, maskField: AKMaskField?){
//        
//        let field = textField ?? maskField
//        
//        switch typeField {
//            
//        case .addressName: self.addressToCreate?.title = field?.text
//        case .addressDescription: self.addressToCreate?.addressDescription = field?.text
//        case .addressNumber: break
//        case .addressState: self.addressToCreate?.city?.state?.name = field?.text
//        case .addressCity: self.addressToCreate?.city?.name = field?.text
//        case .addressReference: self.addressToCreate?.reference = field?.text
//        case .addressNeighbourhood: self.addressToCreate?.neighbourhood = field?.text
//        case .addressCep: self.addressToCreate?.cep = field?.text
//            
//        }
//    }
    
    
    func checkMaskFieldIsEmpty(field: AKMaskField) -> Bool {
        switch field.maskStatus{
        case .clear, .incomplete:
            return true
        default:
            return false
        }
    }
}
