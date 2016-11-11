
//
//  User.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 10/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class User: NSObject{
    
    var id: String?
    var name: String?
    var email: String?
    var token: String?


    convenience init(data: (Dictionary<String, AnyObject>)) {
        self.init()
        
        print(data)
        self.setDataFromWS(data: data)
    }
    
    
    override init() {
        super.init()
    }
    
    init (_name:String,_email:String){
        self.name = _name
        self.email = _email
    }
    
    
    func setDataFromWS(data: (Dictionary<String, AnyObject>)) {
        
        if let id = data ["_id"] as? String { self.id = id }
        
        if let email = data ["email"] as? String { self.email = email }
        
        if let token = data ["token"] as? String { self.token = token }
        
        if let name = data ["name"] as? String { self.name = name }
        
    }
    
    
    func getAsDictionaryForWS() -> Dictionary<String, String> {
        
        var dic = Dictionary<String, String>()
        
        if let email = self.email {
            dic ["email"] = email
        }
        
        if let name  = self.name  {
            dic ["name"] = name
        }
        
        if let id  = self.id  {
            dic ["_id"] = id
        }
        if let token  = self.token
        {
            dic ["token"] = token
        }
        
        
        
        
        return dic
    }

}
