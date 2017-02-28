//
//  UICollectionViewCell+Utils.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 28/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol UICollectionViewCellHelper: class {
    static var cellSize: CGSize { get }
    static var identifier: String { get }
}

extension UICollectionViewCellHelper {
    static var cellSize: CGSize {
        return CGSize(width: 50.0, height: 50.0)
    }
    
    static var identifier: String {
        return ""
    }
}

extension UICollectionViewCell: UICollectionViewCellHelper {
    
}
