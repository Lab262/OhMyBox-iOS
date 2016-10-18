//
//  ClosetTableViewCell.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ClosetTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    static let identifier = "closetCell"
    
    func registerNibs () {
        
        
        self.collectionView.register(UINib(nibName: "ShowCaseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ShowCaseCollectionViewCell.identifier)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerNibs()
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowCaseCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    
}
