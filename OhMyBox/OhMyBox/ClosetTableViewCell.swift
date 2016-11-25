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

    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
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
    
    
    override func didMoveToWindow() {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerNibs()
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.setScaledDesginParam(scaledPattern: .horizontalCenter, maxScale: 1.0, minScale: 0.97, maxAlpha: 1.0, minAlpha: 0.8)
        //collectionView.scaledVisibleCells()
        
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

// MARK: - UIScrollViewDelegate
//
extension ClosetTableViewCell: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.scaledVisibleCells()
    }
    

    
}

extension ClosetTableViewCell: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.bounds.size.width * 0.94
        let height = width*1.2
        return CGSize(width: width, height: height)
        
    }
    
    
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        
//    }
    
    
}

