//
//  CollectionSegmentedControlController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 28/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

typealias VoidHandler = () -> ()

protocol CollectionSegmentedControlDelegate: class {
    
    func numberOfOptions(in collectionPickerController: CollectionSegmentedControlController) -> Int
    func collectionSegmentedControl(_ collectionPickerController: CollectionSegmentedControlController, titleForOptionAt index: Int) -> String
    func collectionSegmentedControl(_ collectionPickerController: CollectionSegmentedControlController, handlerForOptionAt index: Int) -> VoidHandler?
    func collectionSegmentedControl(_ collectionPickerController: CollectionSegmentedControlController, sizeForItemAt index: Int) -> CGSize
    
}

class CollectionSegmentedControlController: NSObject, UICollectionViewDataSource {

    weak open var delegate: CollectionSegmentedControlDelegate!
    weak open var collectionView: UICollectionView!
    
    var selectedIndexPath = IndexPath(item: 0, section: 0)
    
    override init() {
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.numberOfOptions(in: self) ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let title = delegate!.collectionSegmentedControl(self, titleForOptionAt: indexPath.item)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionSegmentedControlViewCell.identifier, for: indexPath) as! CollectionSegmentedControlViewCell
        cell.title = title
        
        if indexPath == selectedIndexPath && !cell.isSelected {
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .left)
            self.collectionView(collectionView, didSelectItemAt: indexPath)
            cell.isSelected = true
        }
        
        return cell
    }
}

extension CollectionSegmentedControlController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedIndexPath = indexPath
        delegate?.collectionSegmentedControl(self, handlerForOptionAt: selectedIndexPath.item)?()
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

}

extension CollectionSegmentedControlController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return delegate?.collectionSegmentedControl(self, sizeForItemAt: indexPath.item) ?? CGSize.zero
    }
}
