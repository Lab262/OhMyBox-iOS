//
//  HomePresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 26/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol HomeView {
    
}

class HomePresenter: NSObject {

    var view: HomeView
    
    init(view: HomeView) {
        
        self.view = view
    }
    
}
