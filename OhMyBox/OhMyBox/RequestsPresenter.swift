//
//  RequestsPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol RequestsView {
    
    func reloadData()
}

class RequestsPresenter: NSObject {

    var view: RequestsView?
    
    var requests: [Any] = [1, 2, 3]
}
