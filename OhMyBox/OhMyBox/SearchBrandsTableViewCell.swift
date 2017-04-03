//
//  SearchBrandsTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 26/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SearchBrandsTableViewCell: UITableViewCell {

    static var cellHeight: CGFloat {
        return 75.0
    }
    static var identifier: String {
        return "searchBrandTableViewCell"
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    let marginWidth: CGFloat = 17.0
    let collectionViewItemSpacing: CGFloat = 10.0
    
    // Placeholder type
    var brands: [Any] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNibs()
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: marginWidth, bottom: 0, right: marginWidth)
        flowLayout.minimumLineSpacing = collectionViewItemSpacing
    }
    
    func registerNibs() {
        collectionView.register(UINib.init(nibName: "SearchBrandCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: SearchBrandCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension SearchBrandsTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchBrandCollectionViewCell.identifier, for: indexPath) as! SearchBrandCollectionViewCell
        
        // Set cell image from brand 
        
        return cell
    }
}

extension SearchBrandsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return SearchBrandCollectionViewCell.cellSize
    }
}
