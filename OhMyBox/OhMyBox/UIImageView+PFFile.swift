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
    
    func loadPFFile(_ file: PFFile) {
        
        self.addLoadingFeedback()
        file.getDataInBackground { (data, error) in
            
            guard data != nil else { return }
            if let image = UIImage(data: data!) {
                
                self.image = image
            }
            self.removeLoadingFeedback()
        }
    }
}
