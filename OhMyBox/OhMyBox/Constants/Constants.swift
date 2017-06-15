
//
//  File.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 02/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

// MARK: Register error cases
enum RegisterError: Error {
    
    case invalidName
    case invalidEmail
    case invalidPassword
    
    var message: String {
        
        let message: String
        switch self {
            
        case .invalidName: message = "Nome inválido"
        case .invalidEmail: message = "Email inválido"
        case .invalidPassword: message = "Senha inválida"
        }
        
        return message
    }
}

// MARK: Keys for known objects put in UserDefaults
struct UserDefaultsKeys {
    
    static let cartBoxes = "cartBoxes"
    static let purchaseRequestFeedbacks = "purchaseRequestFeedbacks"
}

// MARK: My public key of Moip

struct MoipKey {
    static let publicKey = ""
}

struct UserPurchaseInformations {
    static let name = "name"
    static let cpf = "cpf"
    static let email = "email"
    static let birthdate = "birthdate"
    static let phone = "phone"
    static let addressDescription = "addressDescription"
    static let addressNumber = "addressNumber"
    static let addressComplement = "addressComplement"
    static let addressNeighborhood = "addressNeighborhood"
    static let cep = "cep"
    static let city = "city"
    static let state = "state"
    static let cardFlag = "cardFlag"
    static let cardName = "cardName"
    static let cardNumber = "cardNumber"
    static let cardValidity = "cardValidity"
    static let cardCvv = "cardCvv"
    static let cardHolderFullName = "cardHolderFullName"
    static let cardHolderBirthdate = "cardHolderBirthdate"
    static let cardHolderCpf = "cardHolderCpf"
    static let cardHolderPhone = "cardHolderPhone"
}


struct CloudFunctions {
    static let getUserById = "getUserById"
    static let buyItem = "buyItem"
}

struct UserKeys {
    static let userMoipId = "userMoipId"
}

struct UserMoipKeys {
    static let id = "id"
    static let ownId = "ownId"
    static let fullName = "fullname"
    static let birthDate = "birthDate"
    static let email = "email"
    static let phone = "phone"
    static let taxDocument = "taxDocument"
    static let shippingAddress = "shippingAddress"
}

struct PhoneKeys {
    static let countryCode = "countryCode"
    static let areaCode = "areaCode"
    static let number = "number"
}

struct TaxDocumentKeys {
    static let type = "type"
    static let number = "number"
}

struct ShippingAddressKeys {
    static let zipCode = "zipCode"
    static let street = "street"
    static let streetNumber = "streetNumber"
    static let complement = "complement"
    static let city = "city"
    static let district = "district"
    static let state = "state"
    static let country = "country"
}

struct OrderKeys {
    static let ownId = "ownId"
    static let items = "items"
}

struct ItemKeys {
    static let product = "product"
    static let quantity = "quantity"
    static let detail = "detail"
    static let price = "price"
}

struct CreditCardKeys {
    static let expirationMonth = "expirationMonth"
    static let expirationYear = "expirationYear"
    static let number = "number"
    static let cvc = "cvc"
    static let holder = "holder"
}

struct HolderKeys {
    static let fullname = "fullname"
    static let birthdate = "birthdate"
    static let cpf = "cpf"
    static let phone = "phone"
    static let taxDocument = "taxDocument"
}


// MARK: Segue Identifiers
struct SegueIdentifiers {
    
    // From home
    static let homeToProductDetail = "goToProductDetail"
    static let homeToBoxDetail = "goToBoxDetail"
    
    // From brands
    static let brandsToBrandDetail = "goToBrandDetail"
    
    // From brand detail
    static let brandDetailToProductDetail = "goToProductDetail"
    static let brandDetailToCollecions = "goToCollections"
    static let brandDetailToContact = "brandDetailToContact"
    static let brandDetailToBoxDetail = "goToBoxDetail"
    
    // From shopping box
    static let shoppingBoxToPurchase = "shoppingBoxToPurchase"
    static let shoppingRequestsToRating = "shoppingRequestsToRating"
    static let shoppingRequestsToRequestDetail = "shoppingRequestsToRequestDetail"
    static let shoppingRequestDetailToRating = "shoppingRequestDetailToRating"
    static let shoppingBoxToSelectCard = "goToSelectCard"
    
    static let selectCardToCreateAccount = "goToCreateAccount"
    
    // From purchase
    static let purchaseToPurchaseSuccessful = "purchaseToPurchaseSuccessful"
    
    // From box detail
    static let boxDetailToProductDetail = "boxDetailToProductDetail"
    
    // From wishlist
    static let wishListToBoxDetail = "goToBoxDetail"
}

// MARK: Notification Names
struct Notifications {
    
    static let selectHomeViewController = NSNotification.Name(rawValue: "selectHomeViewController")
    static let goToBoxViewController = NSNotification.Name(rawValue: "selectBoxViewController")
    static let selectBoxRequestsViewController = NSNotification.Name(rawValue: "selectBoxRequestsViewController")
    
    static let cartUpdated = NSNotification.Name(rawValue: "cartUpdated")
    static let wishlistUpdated = NSNotification.Name(rawValue: "wishlistUpdated")
}


// MARK: Purchase Successful Tips @ PurchaseSuccessfulViewController
struct PurchaseSuccessfulTips {
    
    static let poppinsLight = UIFont(name: "Poppins-Light", size: 15.0)!
    static let poppinsMedium = UIFont(name: "Poppins-Medium", size: 15.0)!
    static let characterSpacing: CGFloat = 1.31
    
    private static var tip0: NSAttributedString {
        
        let tip = NSMutableAttributedString(string: "Na aba de \"PEDIDOS\" a Marca vai te informar sobre o status do seu pedido e você vai informar a Marca quando seu pedido chegar. Assim todos ganham :)")
        
        let lightRange = NSRange(location: 0, length: tip.length)
        let mediumRange = NSRange(location: 10, length: 9)
        
        tip.addAttribute(NSFontAttributeName, value: PurchaseSuccessfulTips.poppinsLight, range: lightRange)
        tip.addAttribute(NSFontAttributeName, value: PurchaseSuccessfulTips.poppinsMedium, range: mediumRange)
        tip.addAttribute(NSKernAttributeName, value: PurchaseSuccessfulTips.characterSpacing, range: lightRange)
        
        
        return NSAttributedString(attributedString: tip)
    }
    
    private static var tip1: NSAttributedString {
        
        let tip = NSMutableAttributedString(string: "Caso precise falar sobre seu pedido, entre em contato com a Marca ou com a Oh My Box.")
        
        let lightRange = NSRange(location: 0, length: tip.length)
        let mediumRanges = [NSRange(location: 60, length: 5), NSRange(location: 75, length: 9)]
        
        tip.addAttribute(NSFontAttributeName, value: PurchaseSuccessfulTips.poppinsLight, range: lightRange)
        for range in mediumRanges {
            tip.addAttribute(NSFontAttributeName, value: PurchaseSuccessfulTips.poppinsMedium, range: range)
        }
        tip.addAttribute(NSKernAttributeName, value: PurchaseSuccessfulTips.characterSpacing, range: lightRange)
        
        return NSAttributedString(attributedString: tip)
    }
    
    private static var tip2: NSAttributedString {
        
        let tip = NSMutableAttributedString(string: "Se tiver dúvidas sobre o prazo de entrega, consulte a política de entrega na página da Marca.")
        
        let lightRange = NSRange(location: 0, length: tip.length)
        let mediumRange = NSRange(location: 54, length: 19)
        
        tip.addAttribute(NSFontAttributeName, value: PurchaseSuccessfulTips.poppinsLight, range: lightRange)
        tip.addAttribute(NSFontAttributeName, value: PurchaseSuccessfulTips.poppinsMedium, range: mediumRange)
        tip.addAttribute(NSKernAttributeName, value: PurchaseSuccessfulTips.characterSpacing, range: lightRange)
        
        return NSAttributedString(attributedString: tip)
    }
    
    static var tips: [NSAttributedString] {
        return [tip0, tip1, tip2]
    }
}


