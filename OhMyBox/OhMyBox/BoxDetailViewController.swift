//
//  BoxDetailViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 25/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class BoxDetailViewController: UIViewController {

    @IBOutlet weak var navigationBar: IconNavigationBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var collectionHeader: BoxDetailHeaderCollectionReusableView!
    
    var presenter: BoxDetailPresenter!
    
    override func viewDidLoad() {
        
        presenter = BoxDetailPresenter(view: self)
        
        super.viewDidLoad()
        registerNibs()
        
        
    }

    func registerNibs() {
        
        collectionView.registerNibFrom(BoxProductCollectionViewCell.self)
        
        let headerNib = UINib(nibName: BoxDetailHeaderCollectionReusableView.nibName, bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: BoxDetailHeaderCollectionReusableView.identifier)
    }

}

extension BoxDetailViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2 //placeholder
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoxProductCollectionViewCell.identifier, for: indexPath) as! BoxProductCollectionViewCell
        
        cell.info = (#imageLiteral(resourceName: "product_placeholder"), "Capinha cool")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BoxDetailHeaderCollectionReusableView.identifier, for: indexPath) as? BoxDetailHeaderCollectionReusableView {
           
            collectionHeader = view
            return view
        } else {
            
            return UICollectionReusableView()
        }
    }
}

extension BoxDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return BoxProductCollectionViewCell.cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return BoxDetailHeaderCollectionReusableView.viewSize
    }
    
}

extension BoxDetailViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension BoxDetailViewController: BoxDetailView {
    
}
