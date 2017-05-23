//
//  RatingPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 23/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

protocol RatingView {
    
    func dismiss()
}

class RatingPresenter: NSObject {

    var view: RatingView?
    var purchaseRating: PurchaseRating?
    
    func startRating(purchaseRequest: PurchaseRequest) {
        
        guard let user = User.current else { return }
        
        purchaseRating = PurchaseRating(buyer: user, brand: purchaseRequest.box.brand, purchaseRequest: purchaseRequest)
    }
    
    func setRating(_ rating: Int) {
        
        purchaseRating?.rating = NSNumber(integerLiteral: rating)
    }
    
    func setFeedbackOptions(_ options: [PurchaseRatingFeedback]) {
        
        for option in options {
            purchaseRating?.feedbackOptions.add(option)
        }
    }
    
    func sendRating() {
        
        purchaseRating?.saveInBackground() { (success, error) in
            
            if success {
                
                self.view?.dismiss()
            }
        }
    }
    
}
