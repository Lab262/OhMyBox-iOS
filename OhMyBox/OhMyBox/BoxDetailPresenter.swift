//
//  BoxDetailPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 26/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol BoxDetailView {
    
}

class BoxDetailPresenter: NSObject {

    var box: AnyObject!
    var view: BoxDetailView
    
    init(view: BoxDetailView) {
        
        self.view = view
    }
    
    
    
}
