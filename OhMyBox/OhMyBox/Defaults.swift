//
//  Defaults.swift
//  OhMyBox
//
//  Created by Felipe perius on 11/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit


enum DefaultDataType: String {
    case Email = "email",
    Password = "password",
    Username = "username",
    IsLogged = "isLogged"
}
class Defaults: NSObject {
   
    static let sharedInstance = Defaults()
    
    let userDefaults = UserDefaults()
    
    var isLogged: Bool? {
        get {
            return userDefaults.bool(forKey: DefaultDataType.IsLogged.rawValue)
        }
        set {
            userDefaults.set(newValue!, forKey: DefaultDataType.IsLogged.rawValue)
        }
    }
    
    
    var email: String? {
        get {
            return userDefaults.string(forKey: DefaultDataType.Email.rawValue)
        }
        set {
            userDefaults.setValue(newValue, forKey: DefaultDataType.Email.rawValue)
        }
    }
    
    var password: String? {
        get {
            return userDefaults.string(forKey: DefaultDataType.Password.rawValue)
        }
        set {
            userDefaults.setValue(newValue, forKey: DefaultDataType.Password.rawValue)
        }
    }
    
    var username: String? {
        get {
            return userDefaults.string(forKey: DefaultDataType.Username.rawValue)
        }
        set {
            userDefaults.setValue(newValue, forKey: DefaultDataType.Username.rawValue)
        }
    }
    
    func deleteAllValues() {
        for key in Array(userDefaults.dictionaryRepresentation().keys) {
            if key != DefaultDataType.Email.rawValue {
                userDefaults.removeObject(forKey: key)
            }
        }
    }
}
