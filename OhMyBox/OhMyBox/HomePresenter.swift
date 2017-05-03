//
//  HomePresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 26/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse

protocol HomeView {
    
    func reloadData()
}

class HomePresenter: NSObject {

    var boxes: [Box] = []
    var selectedBox: Box?
    var view: HomeView?
    
    override init() {
        
        super.init()
    }
    
    func loadBoxes() {
        
        let query = PFQuery(className: Box.parseClassName())
        
        query.findObjectsInBackground { (objects, error) in
            
            if let boxes = objects as? [Box] {
                
                self.boxes = boxes
                self.view?.reloadData()
                print("lodaded")
            } else {
                
            }
        }
    }
    
}
