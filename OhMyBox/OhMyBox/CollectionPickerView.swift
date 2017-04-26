//
//  UICollectionPickerView.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 24/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class CollectionPickerView: UIView {

    var collectionPickerOptions: [String] = []
    var collectionPickerHandlers: [() -> ()] = []
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var optionIndicatorImageView: UIImageView!
    
    var collectionPickerController = CollectionPickerController()
    
    var showsIndicator: Bool = true
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.nibInit()
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if Bundle.main.loadNibNamed("CollectionPickerView", owner: self, options: nil) != nil {
            view.frame = bounds
            addSubview(view)
        }
        
        collectionView.dataSource = collectionPickerController
        collectionView.delegate = collectionPickerController
        
        collectionPickerController.delegate = self
        collectionPickerController.collectionView = collectionView
        
        collectionView.register(UINib.init(nibName: "CollectionPickerViewCell", bundle: nil), forCellWithReuseIdentifier: CollectionPickerViewCell.identifier)
        
        let margin = collectionView.frame.width/3
        (collectionView.collectionViewLayout as! CenterCellCollectionViewFlowLayout).sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        (collectionView.collectionViewLayout as! CenterCellCollectionViewFlowLayout).centerOffset = CGPoint(x: margin/2, y: 0)
        
        optionIndicatorImageView.isHidden = !showsIndicator
    }

}

extension CollectionPickerView: CollectionPickerDelegate {
    
    func numberOfOptions(in collectionPickerController: CollectionPickerController) -> Int {
        return collectionPickerOptions.count
    }
    
    func collectionPickerController(_ collectionPickerController: CollectionPickerController, titleForOptionAt index: Int) -> String {
        return collectionPickerOptions[index]
    }
    
    func collectionPickerController(_ collectionPickerController: CollectionPickerController, handlerForOptionAt index: Int) -> CollectionPickerOptionHandler? {
        
        return collectionPickerHandlers.object(at: index)
    }
    
    func collectionPickerController(_ collectionPickerController: CollectionPickerController, sizeForItemAt index: Int) -> CGSize {
        return CollectionPickerViewCell.cellSize
    }
}
