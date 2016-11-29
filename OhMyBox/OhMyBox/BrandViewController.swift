//
//  BrandViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 28/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class BrandViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var clotingArray: [String]?
    
    func registerNibs() {
        self.tableView.register(UINib(nibName: "HeaderTitleTableViewCell", bundle: nil), forCellReuseIdentifier: HeaderTitleTableViewCell.identifier)
        self.tableView.register(UINib(nibName: "ShowCaseCollectionViewCell", bundle: nil), forCellReuseIdentifier: ShowCaseCollectionViewCell.identifier)
        
        self.tableView.register(UINib(nibName: "ShowCaseBrandTableViewCell", bundle: nil), forCellReuseIdentifier: ShowCaseBrandTableViewCell.identifier)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.clotingArray = [String]()
        self.clotingArray?.append("Cloting One")
        self.clotingArray?.append("Cloting Two")
        self.clotingArray?.append("cloting Three")
        self.registerNibs()
    }
    

    func generateRecommendedBrandCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ClosetTableViewCell.identifier, for: indexPath) as! ClosetTableViewCell
        cell.tagType = 2
        cell.delegate = self
        cell.followingClothes = false
        cell.identifierSegue = "detailBrandView"
        cell.clothingtArray = self.clotingArray!
        
        return cell
    }
    
    func generateFollowedBrandsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ClosetTableViewCell.identifier, for: indexPath) as! ClosetTableViewCell
        cell.tagType = 2
        cell.delegate = self
        cell.followingClothes = true
        cell.identifierSegue = "detailBrandView"
        cell.clothingtArray = self.clotingArray!
        
        return cell
    }
    
    func generateBrandCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ShowCaseBrandTableViewCell.identifier, for: indexPath) as! ShowCaseBrandTableViewCell
        
        
        return cell
    }
    
    func generateProducteCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WishTableViewCell.identifier, for: indexPath) as! WishTableViewCell
        
        cell.productImage.image = UIImage(named:"dressImage")
        
        return cell
    }
    
    func generateHeaderFollowedBrandsCell(_ tableView: UITableView) -> UITableViewCell {
        
        let header = tableView.dequeueReusableCell(withIdentifier:HeaderTitleTableViewCell.identifier) as! HeaderTitleTableViewCell
        
        header.firstTitleLineLabel.text = "MARCAS QUE"
        header.iconImage.image = #imageLiteral(resourceName: "iconHeaderType7_image")
        header.widthIconConstraint.constant = 35
        header.heightIconConstraint.constant = 21
        header.layoutIfNeeded()
        header.secondTitleLineLabel.text = "EU SIGO"
        
        return header
    }
    
    func generateHeaderRecommendedBrandsCell(_ tableView: UITableView) -> UITableViewCell {
        
        let header = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier) as! HeaderTitleTableViewCell
        
        header.firstTitleLineLabel.text = "RECOMENDADOS"
        header.iconImage.image = #imageLiteral(resourceName: "iconHeaderType7_image")
        header.widthIconConstraint.constant = 35
        header.heightIconConstraint.constant = 21
        header.layoutIfNeeded()
        header.secondTitleLineLabel.text = "PARA VOCÊ"
        
        return header
    }
    
    func generateHeaderAllBrandsCell(_ tableView: UITableView) -> UITableViewCell {
        
        let header = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier) as! HeaderTitleTableViewCell
        
        header.firstTitleLineLabel.text = "TODAS"
        header.iconImage.image = #imageLiteral(resourceName: "iconHeaderType5_image")
        header.iconImage.image = #imageLiteral(resourceName: "iconHeaderType7_image")
        header.widthIconConstraint.constant = 35
        header.heightIconConstraint.constant = 21
        header.layoutIfNeeded()
        header.secondTitleLineLabel.text = "AS MARCAS"
        header.titleButtonLabel.text = "Filtrar"
        
        
        return header
    }
}

extension BrandViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        
        case 0:
            return generateFollowedBrandsCell(tableView, cellForRowAt: indexPath)
        case 1:
            return generateRecommendedBrandCell(tableView, cellForRowAt: indexPath)
        case 2:
            return generateBrandCell(tableView, cellForRowAt: indexPath)
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0, 1:
            return 1
        default:
            return 2
        }
     
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
}

extension BrandViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
            
        case 0:
            return generateHeaderFollowedBrandsCell(tableView)
        case 1:
            return generateHeaderRecommendedBrandsCell(tableView)
        default:
            return generateHeaderAllBrandsCell(tableView)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 77
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
            
        case 0, 1:
            let width = self.view.bounds.size.width * 0.94
            let height = width*1.3
            return height
        default:
            let width = self.view.bounds.size.width * 0.98
            let height = width*1.34
            print ("HEIGHT BRAND: \(height)")
            
            return height
            
        }
    }
}

extension BrandViewController: callSegueProtocol {
    
    func callViewController(segueIndentifier:String){
        self.performSegue(withIdentifier:segueIndentifier, sender:self)
    }
}
