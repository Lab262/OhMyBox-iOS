//
//  CollectionSegmentedControlView.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 28/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class CollectionSegmentedControlView: UIView {

    var collectionSegmentedControlOptions: [String] = []
    var collectionSegmentedControlHandlers: [VoidHandler] = []
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var leftArrowButton: UIButton!
    @IBOutlet weak var rightArrowButton: UIButton!
    
    var collectionSegmentedControlViewController = CollectionSegmentedControlController()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        if Bundle.main.loadNibNamed("CollectionSegmentedControlView", owner: self, options: nil) != nil {
            view.frame = bounds
            addSubview(view)
        }
        
        collectionView.dataSource = collectionSegmentedControlViewController
        collectionView.delegate = collectionSegmentedControlViewController
        
        collectionSegmentedControlViewController.delegate = self
        collectionSegmentedControlViewController.collectionView = collectionView
        
        collectionView.registerNibFrom(CollectionSegmentedControlViewCell.self)
        
        leftArrowButton.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
}

extension CollectionSegmentedControlView: CollectionSegmentedControlDelegate {
    
    func numberOfOptions(in collectionPickerController: CollectionSegmentedControlController) -> Int {
        
        return collectionSegmentedControlOptions.count
    }
    
    func collectionSegmentedControl(_ collectionPickerController: CollectionSegmentedControlController, titleForOptionAt index: Int) -> String {
        
        return collectionSegmentedControlOptions[index]
    }
    
    func collectionSegmentedControl(_ collectionPickerController: CollectionSegmentedControlController, handlerForOptionAt index: Int) -> VoidHandler? {
        
        return collectionSegmentedControlHandlers.object(at: index) ?? nil
    }
    
    func collectionSegmentedControl(_ collectionPickerController: CollectionSegmentedControlController, sizeForItemAt index: Int) -> CGSize {
        
        return CollectionSegmentedControlViewCell.cellSize
    }
}
