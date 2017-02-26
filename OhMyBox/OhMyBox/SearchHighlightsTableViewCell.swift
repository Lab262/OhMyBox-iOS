//
//  SearchHighlightsTableViewCell.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 26/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SearchHighlightsTableViewCell: UITableViewCell {

    static let cellHeight: CGFloat = 163.0
    static let identifier = "searchHighlightsTableViewCell"
    @IBOutlet weak var collectionView: UICollectionView!
    
    let marginWidth: CGFloat = 17.0
    let collectionViewItemSpacing: CGFloat = 8.0
    
    // Placeholder type
    var highlights: [Any] = []
    
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
        collectionView.register(UINib.init(nibName: "SearchHighlightCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: SearchHighlightCollectionViewCell.identifier)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension SearchHighlightsTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return highlights.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchHighlightCollectionViewCell.identifier, for: indexPath) as! SearchHighlightCollectionViewCell
        
        // Set cell image from highlight
        
        return cell
    }
}

extension SearchHighlightsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return SearchHighlightCollectionViewCell.cellSize
    }
}
