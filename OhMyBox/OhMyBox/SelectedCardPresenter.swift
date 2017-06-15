//
//  SelectedCardPresenter.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 14/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import MoipEncryptSDK

class SelectedCardPresenter: NSObject {
    
    var user = User.current()
    var userMoip: [UserMoip]?
    var purchaseRequest: PurchaseRequest?
    
    func getUserById() {
        if let id = user?.moipId {
            SelectCardRequest.getUserById(id: id, completionHandler: { (success, msg, userMoip) in
                if success {
                    
                } else {
                    
                }
            })
        }
    }
    
}
