//
//  ProductTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    static let identifier = "productCell"
    let identifierSegue = "detailProduct"

    var delegate : callSegueProtocol?
    
    
    func registerNibs () {
        
        
        self.collectionView.register(UINib(nibName: "ShowProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ShowProductCollectionViewCell.identifier)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerNibs()
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension ProductTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowProductCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    
}

extension ProductTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.callViewController(segueIndentifier: identifierSegue)
    }
    
}
