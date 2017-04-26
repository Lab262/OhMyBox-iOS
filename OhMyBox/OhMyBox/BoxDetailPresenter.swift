//
//  BoxDetailPresenter.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 26/04/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol BoxDetailView {
    
}

class BoxDetailPresenter: NSObject {

    var box: AnyObject!
    var view: BoxDetailView
    
    var boxPlaceholderInfo: BoxDetailHeaderCollectionReusableView.Info = ("EU VOU DE VERÃO", "Box pensada com carinho para quem está indo curtir o verão com total estilo, cheia de opções pra você formar seu estilo!", 100, ["SAPATO", "ACESSÓRIO", "BIJUTERIA"])
    
    init(view: BoxDetailView) {
        
        self.view = view
    }
    
    
    
}
