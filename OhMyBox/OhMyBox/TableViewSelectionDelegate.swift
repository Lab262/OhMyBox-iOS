//
//  TableViewSelectionDelegate.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 23/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol TableViewSelectionDelegate: class {
    
    func tableViewDelegate(_ tableViewDelegate: UITableViewDelegate, didSelectRowWith title: String)
}

protocol CollectionViewSelectionDelegate: class {
    
    func collectionViewDelegate(_ colletionViewDelegate: UICollectionViewDelegate, didSelectItemAt indexPath: IndexPath)
}
