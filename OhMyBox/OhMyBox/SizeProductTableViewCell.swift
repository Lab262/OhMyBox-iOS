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
    static var identifier: String {
        return "sizeProductCell"
    }
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
        cell.circleBorder.isHidden = true
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return size.count
    }
    
    
}

extension SizeProductTableViewCell: UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"sizeProductCell", for: indexPath) as! SizeProductCollectionViewCell
        let cell = collectionView.cellForItem(at: indexPath) as! SizeProductCollectionViewCell

        
        cell.circleBorder.isHidden = false
        cell.titleSizeLabel.textColor = UIColor.white

    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SizeProductCollectionViewCell

        
        cell.circleBorder.isHidden = true
        cell.titleSizeLabel.textColor = UIColor.hexStringToUIColor(hex:"914CEB")

    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let cellWidth = 66
        let cellCount = self.size.count
        let cellSpacing = 0
        
        let totalCellWidth = cellWidth * cellCount
        let totalSpacingWidth = cellSpacing * (cellCount - 1)
        
        var leftInset = ((self.window?.frame.width)! - CGFloat(totalCellWidth + totalSpacingWidth)) / 2;
        var rightInset = leftInset
        
        if rightInset < 0 {
            rightInset = 0
        }
        
        if leftInset < 0 {
            leftInset = 0
        }
        
        return UIEdgeInsetsMake(5, leftInset, 0, rightInset)
    }
}
