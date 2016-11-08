//
//  ClosetTableViewCell.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

protocol callSegueProtocol {
    func callViewController(segueIndentifier:String)
}

class ClosetTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var identifierSegue: String?
    var tagType: Int?
    var followingClothes = false
    var clothingtArray: [String]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    static let identifier = "closetCell"
    var delegate: callSegueProtocol?
    
    
    func registerNibs () {
        
        self.collectionView.register(UINib(nibName: "ShowCaseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ShowCaseCollectionViewCell.identifier)
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

extension ClosetTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowCaseCollectionViewCell.identifier, for: indexPath) as! ShowCaseCollectionViewCell
        
        cell.followingClothes = self.followingClothes
        cell.tagType = tagType
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.clothingtArray == nil {
            return 0
        } else {
            return self.clothingtArray!.count
        }
    
    }
    
    
}

extension ClosetTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        self.delegate?.callViewController(segueIndentifier: identifierSegue!)
            
        
    }
    
}
