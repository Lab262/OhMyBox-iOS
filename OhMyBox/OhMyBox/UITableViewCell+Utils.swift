//
//  UITableViewCell+Utils.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 28/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol UITableViewCellHelper: class {
    static var cellHeight: CGFloat { get }
    static var identifier: String { get }
}

extension UITableViewCellHelper {
    static var cellHeight: CGFloat {
        return 44.0
    }
    
    static var identifier: String {
        return ""
    }
}

extension UITableViewCell: UITableViewCellHelper {
    
}
