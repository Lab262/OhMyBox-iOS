//
//  CreateAccountRequest.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 14/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import Parse
import ObjectMapper
import MoipEncryptSDK

class CreateAccountRequest: NSObject {
    
    static func buyBox(userInformations: [String: String], purchaseRequest: PurchaseRequest, card: MPKCreditCard, completionHandler: @escaping (_ success: Bool, _ msg: String) -> Void) {
        
        var params = [String: [String: Any]]()
        var moipId = [String: String]()
        moipId["userMoipId"] = User.current()!.objectId
        var userParams = [String: Any]()
        let ownId = (User.current()!.objectId)! + userInformations[UserPurchaseInformations.cardNumber]!
        userParams[UserMoipKeys.ownId] = ownId
        
        userParams[UserMoipKeys.fullName] = userInformations[UserPurchaseInformations.name]!
        userParams[UserMoipKeys.email] = userInformations[UserPurchaseInformations.email]!
        userParams[UserMoipKeys.birthDate] = userInformations[UserPurchaseInformations.birthdate]!
        
        var taxDocumentParams = [String: String]()
        taxDocumentParams[TaxDocumentKeys.type] = "CPF"
        taxDocumentParams[TaxDocumentKeys.number] = userInformations[UserPurchaseInformations.cpf]!
        
        var phoneParams = [String: String]()
        let phone = userInformations[UserPurchaseInformations.phone]!
        phoneParams[PhoneKeys.number] = "55"
        phoneParams[PhoneKeys.number] = String(phone.characters.suffix(9))
        phoneParams[PhoneKeys.areaCode] = String(phone.characters.prefix(2))
        
        
        var addressParams = [String: String]()
        addressParams[ShippingAddressKeys.city] = userInformations[UserPurchaseInformations.city]
        addressParams[ShippingAddressKeys.complement] = userInformations[UserPurchaseInformations.addressComplement]
        addressParams[ShippingAddressKeys.street] = userInformations[UserPurchaseInformations.addressDescription]
        addressParams[ShippingAddressKeys.streetNumber] = userInformations[UserPurchaseInformations.addressNumber]
        addressParams[ShippingAddressKeys.zipCode] = userInformations[UserPurchaseInformations.cep]
        addressParams[ShippingAddressKeys.state] = userInformations[UserPurchaseInformations.state]
        addressParams[ShippingAddressKeys.country] = "BRA"
        
        userParams[UserMoipKeys.phone] = phone
        userParams[UserMoipKeys.taxDocument] = taxDocumentParams
        userParams[UserMoipKeys.shippingAddress] = addressParams
        
        
        // order
        
        var orderParams = [String: Any]()
        
        orderParams[OrderKeys.ownId] = purchaseRequest.objectId!
        
        var itemsParams = Array<[String: Any]>()
        
        var itemParam = [String: Any]()
        
        itemParam[ItemKeys.product] = purchaseRequest.box.name
        itemParam[ItemKeys.quantity] = 1
        itemParam[ItemKeys.detail] = "Oh My Box, Box!"
        itemParam[ItemKeys.price] = purchaseRequest.box.price
        itemsParams.append(itemParam)
        
        orderParams[OrderKeys.items] = itemsParams
        
        // credit card
        
        var creditCardParams = [String: Any]()
        creditCardParams[CreditCardKeys.expirationMonth] = card.expirationMonth
        creditCardParams[CreditCardKeys.expirationYear] = card.expirationYear
        creditCardParams[CreditCardKeys.number] = card.number
        creditCardParams[CreditCardKeys.cvc] = card.cvc
        
        var holderParams = [String: Any]()
        
        holderParams[HolderKeys.fullname] = userInformations[UserPurchaseInformations.cardHolderFullName]
        holderParams[HolderKeys.birthdate] = userInformations[UserPurchaseInformations.cardHolderBirthdate]
        
        var taxDocumentHolderParams = [String: String]()
        taxDocumentHolderParams[TaxDocumentKeys.type] = "CPF"
        taxDocumentHolderParams[TaxDocumentKeys.number] = userInformations[UserPurchaseInformations.cardHolderCpf]
        
        var phoneHolderParams = [String: String]()
        let phoneHolder = userInformations[UserPurchaseInformations.cardHolderPhone]!
        phoneHolderParams[PhoneKeys.countryCode] = "55"
        phoneHolderParams[PhoneKeys.number] = String(phoneHolder.characters.suffix(9))
        phoneHolderParams[PhoneKeys.areaCode] = String(phoneHolder.characters.prefix(2))
        
        holderParams[HolderKeys.taxDocument] = taxDocumentParams
        holderParams[HolderKeys.phone] = phoneHolderParams
        
        creditCardParams[CreditCardKeys.holder] = holderParams
        
        params["userMoipId"] = moipId
        params["user"] = userParams
        params["order"] = orderParams
        params["creditCard"] = creditCardParams

        PFCloud.callFunction(inBackground: CloudFunctions.buyItem, withParameters: params) { (objects, error) in
            if let _ = error {
                completionHandler(false, error!.localizedDescription)
            } else {
                
                if let result = objects as? [String:AnyObject] {
                    if let userMoip = Mapper<UserMoip>().map(JSON: result) {
                        
                    }
                }
                
                completionHandler(true, "success")
            }
        }
    }
    
}
