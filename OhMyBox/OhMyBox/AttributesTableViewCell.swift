//
//  AttributesTableViewCell.swift
//  OhMyBox
//
//  Created by Felipe perius on 25/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit
private let reuseIdentifier = "colorCell"

class AttributesTableViewCell: UITableViewCell {
    var colours = [Colour]()
    var lastIndexPath = IndexPath()
    @IBOutlet weak var colorBackgroundView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    static let identifier = "attributeCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initColoursDefault()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
  
    }
       func initColoursDefault(){
        
        let colourBeige = Colour.init(colourid:"1", colourHex: "F2E1E3")
        self.colours.append(colourBeige)

        let colourGray = Colour.init(colourid:"2", colourHex: "D5D5D3")
        self.colours.append(colourGray)
        let colourBlue = Colour.init(colourid:"3", colourHex: "809BBC")
        self.colours.append(colourBlue)

        let colourPinkLight = Colour.init(colourid:"4", colourHex: "FCE1DF")
        self.colours.append(colourPinkLight)
        
        let colourPinkDark = Colour.init(colourid:"4", colourHex: "FCE1DF")
        self.colours.append(colourPinkDark)
     
        let colourBlueDark = Colour.init(colourid:"4", colourHex: "809BBC")
        self.colours.append(colourBlueDark)
        self.colours.append(colourBlueDark)
        self.colours.append(colourBlueDark)
        self.colours.append(colourBlueDark)
        self.colours.append(colourBlueDark)
        self.colours.append(colourBlueDark)

        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

            
    }

}
extension AttributesTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"colorCell", for: indexPath) as! ColorCollectionViewCell
        let colour = colours[indexPath.row]
        cell.circleColor.backgroundColor = UIColor.hexStringToUIColor(hex: colour.colourHex!)
        cell.layoutIfNeeded()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.colours.count
    }
    
    
}

extension AttributesTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let cell = collectionView.cellForItem(at: indexPath) as! ColorCollectionViewCell
       //let colour = colours[indexPath.row]
       
        //cell.roundToCircle()
        //cell.backgroundColor = UIColor.hexStringToUIColor(hex: "989898")
        //cell.circleInternal.roundToCircle()
        //cell.circleInternal.backgroundColor = UIColor.hexStringToUIColor(hex: colour.colourHex!)
        //cell.circleColor.roundToCircle()
       // cell.circleColor.backgroundColor = .white
        if (indexPath != self.lastIndexPath){
            self.lastIndexPath = indexPath
        }
      
        cell.checkColor.isHidden = false
    }
    
     func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: self.lastIndexPath) as! ColorCollectionViewCell
        
        //let colour = colours[indexPath.row]
        //cell.circleColor.roundToCircle()
        //cell.circleColor.backgroundColor = UIColor.hexStringToUIColor(hex: colour.colourHex!)
        //cell.backgroundColor = UIColor.clear
        //cell.circleInternal.backgroundColor = UIColor.clear
        cell.checkColor.isHidden = true 
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let cellWidth = 66
        let cellCount = self.colours.count
        let cellSpacing = 0
        
        let totalCellWidth = cellWidth * cellCount
        let totalSpacingWidth = cellSpacing * (cellCount - 1)
        
        var leftInset = ((self.window?.frame.width)! - CGFloat(totalCellWidth + totalSpacingWidth)) / 2;
        var rightInset = leftInset
        
        if rightInset < 0 {
            rightInset = 0
        }
        
        if leftInset < 0 {
            leftInset = 0
        }
        
        return UIEdgeInsetsMake(5, leftInset, 0, rightInset)
    }
    
}

