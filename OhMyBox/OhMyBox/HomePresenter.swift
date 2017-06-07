//
//  HomePresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 26/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

protocol HomeView: class {
    
    func reloadData()
}

class HomePresenter: NSObject {

    var boxes: [Box] = [] {
        didSet {
            view?.reloadData()
        }
    }
    var selectedBox: Box?
    weak var view: HomeView?
    
    override init() {
        
        super.init()
    }
    
    func loadBoxes() {
        
        BoxRequester.shared.queryBoxes { (boxes, error) in
            
            if let boxes = boxes {
                
                self.boxes = boxes
            }
        }
        
//        let query = PFQuery(className: Box.parseClassName()).includeKey("brand")
//        
//        boxes.removeAll(keepingCapacity: true)
//        query.findObjectsInBackground { (objects, error) in
//            
//            if let boxes = objects as? [Box] {
//                
//                for box in boxes {
//                    
//                    box.queryProducts() { (_) in
//                        
//                        self.boxes.append(box)
//                        self.view?.reloadData()
//                    }
//                }
//            } else {
//                
//            }
//        }
    }
    
}
