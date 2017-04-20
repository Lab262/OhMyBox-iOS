//
//  CollectionTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 20/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    static var identifier: String {
        return "collectionTableViewCell"
    }
    
    static var cellHeight: CGFloat {
        return 0
    }
    
    static var nibName: String {
        return "CollectionTableViewCell"
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionViewDataSource: UICollectionViewDataSource? {
        didSet {
            
            collectionView.dataSource = collectionViewDataSource
        }
    }
    var collectionViewDelegate: UICollectionViewDelegate? {
        didSet {
            
            collectionView.delegate = collectionViewDelegate
        }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        collectionView.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
