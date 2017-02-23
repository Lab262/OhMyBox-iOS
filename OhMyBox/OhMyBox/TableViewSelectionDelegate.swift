//
//  TableViewSelectionDelegate.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 23/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol TableViewSelectionDelegate: class {
    
    func tableViewDelegate(_ tableViewDelegate: UITableViewDelegate, _ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}
