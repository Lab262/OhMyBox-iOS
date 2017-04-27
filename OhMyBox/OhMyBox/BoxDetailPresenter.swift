//
//  BoxDetailPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 26/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol BoxDetailView {
    
    func reloadData()
}

class BoxDetailPresenter: NSObject {

    var box: AnyObject!
    var boxOptionsMaxCount: [Int] = [1, 1, 1]
    var checkedProductsIndexes: [[Int]] = [[0], [0], [0]]
    var categories = ["SAPATO", "ACESSÓRIO", "BIJUTERIA"]
    
    var selectedCategoryIndex: Int = 0 {
        
        didSet {
            
            view.reloadData()
        }
    }
    
    var view: BoxDetailView
    
    var boxPlaceholderInfo: BoxDetailHeaderCollectionReusableView.Info {
        
        return ("EU VOU DE VERÃO", "Box pensada com carinho para quem está indo curtir o verão com total estilo, cheia de opções pra você formar seu estilo!", 100, categories)
    }
    
    init(view: BoxDetailView) {
        
        self.view = view
    }
    
    func checkedItem(at index: Int) {
    
        let checkedProductsCount = checkedProductsIndexes[selectedCategoryIndex].count
        
        if checkedProductsIndexes[selectedCategoryIndex].contains(index) {
           
            if checkedProductsCount > 1 {
                
                _ = checkedProductsIndexes[selectedCategoryIndex].remove(index)
            }
        } else {
            
            let boxOptionsCount = boxOptionsMaxCount[selectedCategoryIndex]
            
            if checkedProductsCount >= boxOptionsCount {
                
                checkedProductsIndexes[selectedCategoryIndex].remove(at: 0)
                checkedProductsIndexes[selectedCategoryIndex].append(index)
            }
        }
        
        view.reloadData()
    }
}