//
//  SelectCardRequest.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 14/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit
import Parse
import ObjectMapper

class SelectCardRequest: NSObject {
    
    static func getUserById(id: String, completionHandler: @escaping (_ success: Bool, _ msg: String, _ usersMoip: [UserMoip]?) -> Void) {
        
        var usersMoip = [UserMoip]()
        var params = [String: String]()
        params[UserKeys.userMoipId] = id
        
        PFCloud.callFunction(inBackground: CloudFunctions.buyItem, withParameters: params) { (objects, error) in
            if let _ = error {
                completionHandler(false, error!.localizedDescription, nil)
            } else {
                
                if let result = objects as? [String:AnyObject] {
                    if let userMoip = Mapper<UserMoip>().map(JSON: result){
                        usersMoip.append(userMoip)
                    }
                }
    
                completionHandler(true, "success", usersMoip)
            }
        }
    }
    
}
