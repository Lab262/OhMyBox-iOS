//
//  SizeProductTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 25/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit
private let reuseIdentifier = "sizeProductCell"
class SizeProductTableViewCell: UITableViewCell {
    static let identifier = "sizeProductCell"
    var size = ["P","PP","M","G","GG"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var sizeBackgroundView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        
//        self.collectionView.layer.borderWidth = 1
//        self.collectionView.layer.borderColor = UIColor(red:184/250, green:184/250, blue:184/250, alpha: 1.0).cgColor

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension SizeProductTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"sizeProductCell", for: indexPath) as! SizeProductCollectionViewCell
        
        cell.titleSizeLabel.text = self.size[indexPath.row]
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return size.count
    }
    
    
}

extension SizeProductTableViewCell: UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    
}