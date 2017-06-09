//
//  BoxRequester.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 07/06/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

class BoxRequester: NSObject {

    static let shared: BoxRequester = {
        return BoxRequester()
    }()
    
    override private init() {
        super.init()
    }
    
    var boxes: [Box] = []
    
    func queryBoxes(completionHandler: (([Box]?, Error?) -> ())? = nil) {
        
        let query = PFQuery(className: Box.parseClassName()).includeKey("brand")
        
        query.findObjectsInBackground { (objects, error) in
            
            guard let boxes = objects as? [Box] else {
                completionHandler?(nil, error)
                return
            }
            
            boxes.forEach {
                $0.queryProductsSync()
            }
            
            self.boxes = boxes
            
            completionHandler?(self.boxes, error)
        }
    }
}
