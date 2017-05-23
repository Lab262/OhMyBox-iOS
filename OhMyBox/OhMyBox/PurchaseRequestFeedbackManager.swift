//
//  PurchaseRequestFeedbackManager.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 23/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class PurchaseRequestFeedbackManager: NSObject {

    static let shared: PurchaseRequestFeedbackManager = {
        return PurchaseRequestFeedbackManager()
    }()
    
    override private init() {
        super.init()
    }
    
    let userDefaults = UserDefaults.standard
    
    var feedbackOptionsPerRating: [Int: [String]] {
        
        var opr: [Int: [String]] = [:]
        for option in feedbackOptions {
            
            let ratingValue = option.rating.intValue
            var strings = opr[ratingValue] ?? []
            strings.append(option.title)
            
            opr[ratingValue] = strings
        }
        
        return opr
    }
    
    var feedbackOptions: [PurchaseRatingFeedback] {
        
        let feedbackOptions: [PurchaseRatingFeedback] = feedbackOptionReflections.flatMap { (reflection) -> PurchaseRatingFeedback in
            
            let purchaseRatingFeedback = PurchaseRatingFeedback(className: PurchaseRatingFeedback.parseClassName(), dictionary: reflection)
            purchaseRatingFeedback.objectId = reflection["objectId"] as? String
            
            return purchaseRatingFeedback
        }
        
        return feedbackOptions
    }
    
    var feedbackOptionReflections: [PFObject.ReflectionType] {
        
        let reflections = userDefaults.array(forKey: UserDefaultsKeys.purchaseRequestFeedbacks) as? [PFObject.ReflectionType]
        
        return reflections ?? []
    }
    
    func loadFeedbackOptions() {
        
        let query = PFQuery(className: PurchaseRatingFeedback.parseClassName())
        
        query.findObjectsInBackground { (objects, error) in
            
            guard let options = objects as? [PurchaseRatingFeedback] else { return }
            
            let optionReflections: [PFObject.ReflectionType] = options.map { $0.reflection }
            
            self.userDefaults.set(optionReflections, forKey: UserDefaultsKeys.purchaseRequestFeedbacks)
            
            self.userDefaults.synchronize()
            
        }
    }
}
