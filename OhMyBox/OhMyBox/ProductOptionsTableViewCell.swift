//
//  ProductOptionsTableViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 20/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProductOptionsTableViewCell: UITableViewCell {

    static var identifier: String {
        return "productOptionsCell"
    }
    
    static var cellHeight: CGFloat {
        return 230.0
    }
    
    static var nibName: String {
        return "ProductOptionsTableViewCell"
    }
    
    var colors: [UIColor] = []
    var sizes: [String] = []
    
    @IBOutlet weak var colorsCollectionView: UICollectionView!
    @IBOutlet weak var sizesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNibs()
        setUpInsets()
    }
    
    func setUpInsets() {
        
        let margin: CGFloat = 18.0
        
        let colorsFlowLayout = colorsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        colorsFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        colorsFlowLayout.minimumLineSpacing = 20.0
        
        let sizesFlowLayout = sizesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        sizesFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        sizesFlowLayout.minimumLineSpacing = 35.0
    }
    
    func centerContentHorizontally(in collectionView: UICollectionView) {
        
        guard let delegate = collectionView.delegate as? UICollectionViewDelegateFlowLayout else {
                return
        }
        
        let itemWidth: CGFloat = delegate.collectionView!(collectionView, layout: collectionView.collectionViewLayout, sizeForItemAt: IndexPath(item: 0, section: 0)).width
        
        let itemSpacing: CGFloat = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).minimumLineSpacing
        let totalWidth: CGFloat = (CGFloat(sizes.count) * itemWidth) + (CGFloat(sizes.count - 1) * itemSpacing)
        
        let margin = (sizesCollectionView.frame.width - totalWidth)/2
        let edge = margin > 0 ? margin : itemWidth/2
        let inset = UIEdgeInsets(top: 0, left: edge, bottom: 0, right: edge)
        
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).sectionInset = inset
    }
    
    func registerNibs() {
        
        colorsCollectionView.registerNibFrom(ColorCollectionViewCell.self)
        sizesCollectionView.registerNibFrom(SizeCollectionViewCell.self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func generateColorCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCollectionViewCell.identifier, for: indexPath) as! ColorCollectionViewCell
        cell.color = colors[indexPath.item]
        
        return cell
    }
    
    func generateSizeCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeCollectionViewCell.identifier, for: indexPath) as! SizeCollectionViewCell
        cell.size = sizes[indexPath.item]
        
        return cell
    }
    
}

extension ProductOptionsTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let number: Int
        
        switch collectionView {
        case colorsCollectionView: number = colors.count
        case sizesCollectionView: number = sizes.count
        default: number = 0
        }
        
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell
        
        switch collectionView {
        case colorsCollectionView: cell = generateColorCell(collectionView, cellForItemAt: indexPath)
        case sizesCollectionView: cell = generateSizeCell(collectionView, cellForItemAt: indexPath)
        default: cell = UICollectionViewCell()
        }
        
        return cell
    }
}

extension ProductOptionsTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.changeToSelectedStyle()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.changeToUnselectedStyle()
    }
}

extension ProductOptionsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size: CGSize
        
        switch collectionView {
        case colorsCollectionView:
            size = ColorCollectionViewCell.cellSize * UIView.widthScaleProportion()
        case sizesCollectionView:
            size = SizeCollectionViewCell.cellSize * UIView.widthScaleProportion()
        default:
            size = CGSize()
        }
        
        return size
    }
}
