
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

// MARK: Segue Identifiers
struct SegueIdentifiers {
    
    // From home
    static let homeToProductDetail = "goToProductDetail"
    
    // From brands
    static let brandsToBrandDetail = "goToBrandDetail"
    
    // From brand detail
    static let brandDetailToProductDetail = "goToProductDetail"
    static let brandDetailToCollecions = "goToCollections"
    static let brandDetailToContact = "brandDetailToContact"
    
    // From shopping box
    static let shoppingBoxToPurchase = "shoppingBoxToPurchase"
    static let shoppingRequestsToRating = "shoppingRequestsToRating"
    
    // From purchase
    static let purchaseToPurchaseSuccessful = "purchaseToPurchaseSuccessful"
}


struct Notifications {
    
    static let selectHomeViewController = NSNotification.Name(rawValue: "selectHomeViewController")
    static let goToBoxViewController = NSNotification.Name(rawValue: "selectBoxViewController")
    static let selectBoxRequestsViewController = NSNotification.Name(rawValue: "selectBoxRequestsViewController")
}

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


