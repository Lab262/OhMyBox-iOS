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
    static var nibName: String { get }
}

extension UICollectionViewCellHelper {
    static var cellSize: CGSize {
        return CGSize(width: 50.0, height: 50.0)
    }
    
    static var identifier: String {
        return ""
    }
    
    static var nibName: String {
        return ""
    }
}

extension UICollectionViewCell: UICollectionViewCellHelper {
    
}

extension UICollectionView {
    
    func registerNibFrom(_ cellClass: UICollectionViewCell.Type) {
        
        let nibName = cellClass.value(forKey: "nibName") as! String
        let cellIdentifier = cellClass.value(forKey: "identifier") as! String
        
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
}
