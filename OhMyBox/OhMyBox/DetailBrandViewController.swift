//
//  DetailBrandViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class DetailBrandViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var clotingArray: [String]?
    
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    
    
    func registerNibs() {
        
    }
    
    func configureTableView () {
        
        self.tableView.estimatedRowHeight = 500
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.layoutIfNeeded()
        
    }
    
    func configureNavigationBar() {
        
        //self.navigationBarView.boxButton.addTarget(self, action: #selector(actionGoCart(_:)), for: .touchUpInside)
        
        //self.navigationBarView.searchButton.addTarget(self, action: #selector(searchProducts(_:)), for: .touchUpInside)
       
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
        self.clotingArray = [String]()
        self.clotingArray?.append("Cloting One")
        self.clotingArray?.append("Cloting Two")
        self.clotingArray?.append("cloting Three")
        self.registerNibs()
        self.configureTableView()

    }
    
    func showAllFeatureds (sender: UIButton) {
        self.performSegue(withIdentifier: "goProductsView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goProductsView" {
            
            if let destinationViewController = segue.destination as? RecommendedViewController {
                
                destinationViewController.isHiddenRecommendedTitle = true
                
            }
        }

    }

}

extension DetailBrandViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
                
            case 0:
                return generatePresentationBrandDetailCell(tableView, cellForRowAt: indexPath)
            case 1:
                return generatePresentationBrandDetailCell(tableView, cellForRowAt: indexPath)
            case 2:
                return generateContactTitleCell(tableView, cellForRowAt: indexPath)
            default:
                return UITableViewCell()
            }
            
        case 1:
            
            switch indexPath.row {
    
            case 0:
                return generateFeaturedProductCell(tableView, cellForRowAt: indexPath)
            default:
                return UITableViewCell()
            }
        case 2:
            
            switch indexPath.row {
        
            case 0:
                return generateCollectionBrandCell(tableView, cellForRowAt: indexPath)
            default:
                return UITableViewCell()
            }
            
        case 3:
            
            switch indexPath.row {
            case 0:
                return generatePromotionProductCell(tableView, cellForRowAt: indexPath)
            default:
                return UITableViewCell()
            }
            
        default:
            return UITableViewCell()
        }
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 3
        case 1:
            return 1
        default:
            return 1
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 4
    }
}

extension DetailBrandViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
            
        case 1:
            
            let header = tableView.dequeueReusableCell(withIdentifier: HeaderTitleSecondTypeTableViewCell.identifier) as! HeaderTitleSecondTypeTableViewCell
            
            header.titleLabel.text = "DESTAQUES"
            header.iconImage.image = #imageLiteral(resourceName: "iconHeaderType7_image")
            
            header.showAll.addTarget(self, action: #selector(showAllFeatureds(sender:)), for: .touchUpInside)

            return header
            
        case 2:
            let header = tableView.dequeueReusableCell(withIdentifier: HeaderTitleSecondTypeTableViewCell.identifier) as! HeaderTitleSecondTypeTableViewCell
            
            header.titleLabel.text = "COLEÇÕES"
            header.iconImage.image = #imageLiteral(resourceName: "iconHeaderType7_image")
            header.showAll.addTarget(self, action: #selector(showAllFeatureds(sender:)), for: .touchUpInside)
            
            return header

        case 3:
            
            let header = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier) as! HeaderTitleTableViewCell
            
            header.firstTitleLineLabel.text = "OH YEAH,"
            header.secondTitleLineLabel.text = "PROMOÇÕES!"
            header.iconImage.image = #imageLiteral(resourceName: "iconHeaderType7_image")
            header.showAllButton.addTarget(self, action: #selector(showAllFeatureds(sender:)), for: .touchUpInside)
            
            return header
            
        default:
            return UIView()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
        case 1, 2:
            return 70
        case 3:
            return 77
        default:
            return 0.1
        }
    }
    
 }

extension DetailBrandViewController: callSegueProtocol {
    
    func callViewController(segueIndentifier:String){
        self.performSegue(withIdentifier:segueIndentifier, sender:self)
    }
}

// MARK: - Generate Cells

extension DetailBrandViewController {
    
    func generateHeaderFeaturedCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleSecondTypeTableViewCell.identifier, for: indexPath) as! HeaderTitleSecondTypeTableViewCell
        
       // cell.titleLabel.text = "DESTAQUES"
        //cell.iconImage.image = UIImage(named: "iconHeaderOrange_image")
        
        return cell
    }
    
    func generatePresentationBrandDetailCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PresentationBrandDetailTableViewCell.identifier, for: indexPath) as! PresentationBrandDetailTableViewCell
        
        
        return cell
    }
    
    func generateContactTitleCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactTitleTableViewCell.identifier, for: indexPath) as! ContactTitleTableViewCell
        
        return cell
        
    }
    
    func generateHeaderCollectionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleSecondTypeTableViewCell.identifier, for: indexPath) as! HeaderTitleSecondTypeTableViewCell
        
        cell.titleLabel.text = "COLEÇÕES"
        cell.iconImage.image = #imageLiteral(resourceName: "iconHeaderType7_image")
        
        return cell
    }
    
    func generatePromotionHeaderViewCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier, for: indexPath) as! HeaderTitleTableViewCell
        
        return cell
    }
    
    func generateCollectionBrandCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ClosetTableViewCell.identifier, for: indexPath) as! ClosetTableViewCell
        
        
        cell.tagType = .none
        cell.imageCloset = #imageLiteral(resourceName: "defaultCollection_image")
        cell.delegate = self
        cell.followingClothes = true
        cell.identifierSegue = "detailBrandView"
        cell.clothingtArray = self.clotingArray!
        cell.layoutIfNeeded()
        
        return cell
    }
    
    func generatePromotionProductCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        
        cell.isAutomaticLayout = true
   
        
        cell.delegate = self
        
        return cell
    }
    
    func generateFeaturedProductCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        
        
        cell.isAutomaticLayout = true
        cell.delegate = self
        
        
        return cell
    }
    
}

