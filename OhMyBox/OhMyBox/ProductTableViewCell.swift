//
//  ProductTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    var isAutomaticLayout: Bool? = false
    @IBOutlet weak var collectionView: UICollectionView!
    static let identifier = "productCell"
    let segueIdentifier = "detailProduct"

    var delegate : callSegueProtocol?
    
    
    func registerNibs () {
        
        
        self.collectionView.register(UINib(nibName: "ShowProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ShowProductCollectionViewCell.identifier)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerNibs()
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.setScaledDesginParam(scaledPattern: .horizontalCenter, maxScale: 1.0, minScale: 1.0, maxAlpha: 1.0, minAlpha: 0.8)
        
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension ProductTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowProductCollectionViewCell.identifier, for: indexPath) as! ShowProductCollectionViewCell
        
        cell.nameProduct.text = "Enfeite Fluffy"
       
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    
}

extension ProductTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.callViewController(segueIndentifier: segueIdentifier)
    }
    
}

extension ProductTableViewCell: UICollectionViewDelegateFlowLayout {
    
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            
        return 0.1
    
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            
        return 0.1
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if isAutomaticLayout! {

            return CGSize(width: self.bounds.size.width * 0.94, height: self.bounds.size.height)
        }
        
        let width = self.bounds.size.width * 0.94
        let height = width*1.2
        return CGSize(width: width, height: height)
            
    }
        
}

extension ProductTableViewCell: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.scaledVisibleCells()
    }
    
    
    
}
