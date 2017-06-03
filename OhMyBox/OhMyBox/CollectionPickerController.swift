//
//  CollectionPickerController.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 16/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

typealias CollectionPickerOptionHandler = () -> ()

protocol CollectionPickerDelegate: class {

    func numberOfOptions(in collectionPickerController: CollectionPickerController) -> Int
    func collectionPickerController(_ collectionPickerController: CollectionPickerController, titleForOptionAt index: Int) -> String
    func collectionPickerController(_ collectionPickerController: CollectionPickerController, handlerForOptionAt index: Int) -> CollectionPickerOptionHandler?
    func collectionPickerController(_ collectionPickerController: CollectionPickerController, sizeForItemAt index: Int) -> CGSize
    
}

class CollectionPickerController: NSObject, UICollectionViewDataSource {
    
    weak open var delegate: CollectionPickerDelegate?
    weak open var collectionView: UICollectionView!
    
    var selectedIndexPath: IndexPath!
    
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
        
        let title = delegate!.collectionPickerController(self, titleForOptionAt: indexPath.item)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionPickerViewCell.identifier, for: indexPath) as! CollectionPickerViewCell
        cell.title = title
        
        return cell
    }
}

extension CollectionPickerController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

        deselectAllItems()
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        updateSelection()
    }
    
    func deselectAllItems() {
        
        if let indexes = collectionView.indexPathsForSelectedItems {
            for index in indexes {
                collectionView.deselectItem(at: index, animated: false)
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if collectionView.indexPathsForSelectedItems == nil {
            updateSelection()
        } else if collectionView.indexPathsForSelectedItems!.isEmpty {
            updateSelection()
        }
    }
    
    func updateSelection() {
        
        let currentIndex = Int(collectionView.contentOffset.x / delegate!.collectionPickerController(self, sizeForItemAt: 0).width)
        let currentIndexPath = IndexPath(item: currentIndex, section: 0)
        
        if currentIndexPath != selectedIndexPath {
            delegate?.collectionPickerController(self, handlerForOptionAt: currentIndex)?()
            selectedIndexPath = currentIndexPath
        }
    }
}

extension CollectionPickerController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return delegate?.collectionPickerController(self, sizeForItemAt: indexPath.item) ?? CGSize.zero
    }
}
