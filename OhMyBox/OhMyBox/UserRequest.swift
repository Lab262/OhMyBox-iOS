//
//  UserRequest.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 23/09/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import Parse
import ParseFacebookUtilsV4

class UserRequest: NSObject {

    static func loginWithFacebook(completionHandler: ((Bool, Error?) -> ())?) {
        
        let permissions = ["public_profile", "email"]
        
        PFFacebookUtils.logInInBackground(withReadPermissions: permissions) { (user, error) in
            
            if let user = user {
                
                user["userType"] = User.UserType.buyer.rawValue
                if user.isNew {
                    
                    self.updateUserByFacebook(completionHandler: completionHandler)
                } else {
                    
                    do {
                        try user.save()
                    } catch { }
                    completionHandler?(true, nil)
                }
            } else {
                
                completionHandler?(false, nil)
            }
        }
    }
    
    static func updateUserByFacebook(completionHandler: ((Bool, Error?) -> ())?) {
        
        let firstNameKey = "first_name"
        let lastNameKey = "last_name"
        let emailKey = "email"
        let idKey = "id"
        
        let requestParameters = ["fields": "\(idKey), \(emailKey), \(firstNameKey), \(lastNameKey)"]
        let userDetails = FBSDKGraphRequest(graphPath: "me", parameters: requestParameters)
        let newUser = PFUser.current()!
        userDetails!.start { (connection, result, error) -> Void in
            
            if error != nil {
                
                completionHandler?(false, error)
            } else if let data = result as? [String: Any] {
                
                let wfirstName = data[firstNameKey] as? String
                let wlastName = data[lastNameKey] as? String
                let wemail = data[emailKey] as? String
                let wid = data[idKey] as? String
                
                guard case let (firstName?, lastName?, email?, id?) = (wfirstName, wlastName, wemail, wid) else {
                    
                    completionHandler?(false, nil)
                    return
                }
                
                newUser.username = email
                newUser["firstName"] = firstName
                newUser["lastName"] = lastName
                newUser["email"] = email
                
                if let userPhoto = self.getPhotoOfFacebookInPFFile(userId: id) {
                    
                    newUser["photo"] = userPhoto
                }
            }
            newUser.saveInBackground(block: completionHandler)
        }
    }
    
    static func getPhotoOfFacebookInPFFile(userId: String) -> PFFile? {
        var photoInPFFile: PFFile?
        
        if let url = URL(string: "https://graph.facebook.com/" + userId + "/picture?type=large") {
            do {
                let contents = try Data(contentsOf: url)
                photoInPFFile = PFFile(data: contents, contentType: "image/jpeg")
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
        return photoInPFFile
    }
    
    static func login(with username: String, password: String, completionHandler: ((Error?) -> ())?) {
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            
            completionHandler?(error)
        }
    }
    
    static func create(user: User, password: String, completionHandler: ((Bool, String) -> ())?) {
        
        user.userType = User.UserType.buyer.rawValue
        user.username = user.email
        user.password = password
        
        user.signUpInBackground { (success, error) in
            
            let message: String
            if success {
                
                message = "success"
            } else if let error = error {
                
                message = error.localizedDescription
            } else {
                
                message = ""
            }
            
            completionHandler?(success, message)
        }
    }
}
