//
//  ApplicationState.swift
//  LeituraDeBolso
//
//  Created by Huallyd Smadi on 31/08/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit
import Alamofire

//
//#if DEVELOPMENT
//    #else
//#endif


//let URL_WS_SERVER = "https://leituradebolso.herokuapp.com/api/v0/"
let URL_WS_LOCAL = "http://localhost:8080/api/v0/"
let URL_WS_SERVER = "http://ohmybox-stg.herokuapp.com/api/v0/"
let TOKEN = ["token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRtYjA3MTBAZ21haWwuY29tIiwiaWQiOiI1N2U1YmIyNWU5MzgwNTAzMDBjMGI5MTQiLCJpYXQiOjE0NzU1MzczODV9.0f4Bm6rYgdiJWoCKMGJDNdKqKd9yCzLJ0NMxK3sGLkc"]



class ApplicationState: NSObject {
    
//    var allReadings = [Reading]()
//    var favoriteReads = [Reading]()
//    var unreadReadings = [Reading]()
//    var currentUser: User?
    
    static let sharedInstance : ApplicationState = {
        let instance = ApplicationState(singleton: true)
        return instance
    }()
    
    
    private init(singleton: Bool) {
        super.init()
        
       // self.currentUser = DBManager.getAll().first
        
    }

}
