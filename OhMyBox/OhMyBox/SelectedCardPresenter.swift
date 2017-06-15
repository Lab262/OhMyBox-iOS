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
    
    
    func getUserById() {
        
        SelectCardRequest.getUserById(ids: ["CUS-RY4E1PVW7S4S"], completionHandler: { (success, msg, userMoip) in
            if success {
                
            } else {
                
            }
        })
        
//        if let moipIds = user?.moipIds {
//            if moipIds.count > 0 {
//                SelectCardRequest.getUserById(ids: moipIds, completionHandler: { (success, msg, userMoip) in
//                    if success {
//                        
//                    } else {
//                        
//                    }
//                })
//            }
//        }
    }
    
}
