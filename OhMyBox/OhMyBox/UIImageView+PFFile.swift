//
//  UIImageView+PFFile.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 24/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import Parse
import UIKit

extension UIImageView {
    
    func loadPFFile(_ file: PFFile, completion: ((Data?) -> ())? = nil) {
        
        self.addLoadingFeedback()
        
        if let data = file.loadedData {
            
            if let image = UIImage(data: data) {
             
                self.image = image
            }
            
            self.removeLoadingFeedback()
            completion?(data)
        } else {
            
            file.getDataInBackground { (data, error) in
                
                if let data = data {
                    
                    if let image = UIImage(data: data) {
                        
                        self.image = image
                    }
                }
                
                file.loadedData = data
                completion?(data)
                self.removeLoadingFeedback()
            }
        }
    }
}
