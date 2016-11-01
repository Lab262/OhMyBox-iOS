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
    
    func generateHeaderRecommendedCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier, for: indexPath) as! HeaderTitleTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    
    func generateHeaderAllBrandsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier, for: indexPath) as! HeaderTitleTableViewCell
        cell.selectionStyle = .none
      //  cell.firstTitleLineLabel.text = "TODAS"
        //cell.secondTitleLineLabel.text = "AS LOJAS"
        
        return cell
    }
    
    
    
    func generateRecommendedBrandCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ClosetTableViewCell.identifier, for: indexPath) as! ClosetTableViewCell
        cell.tagType = 1
      //  cell.delegate = self
        cell.clothingtArray = self.clotingArray!
        
        return cell
    }
    
    func generateBrandCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ShowCaseBrandTableViewCell.identifier, for: indexPath) as! ShowCaseBrandTableViewCell
        
       // cell.brandImage.image = UIImage(named: "")
        
        
        return cell
    }
}

extension BrandViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if indexPath.section == 0{
            
            switch indexPath.row {
                
            case 0:
                return self.generateHeaderRecommendedCell(tableView, cellForRowAt: indexPath)
            case 1:
                return self.generateRecommendedBrandCell(tableView, cellForRowAt: indexPath)
            default:
                return UITableViewCell()
            }
        } else {
            
            return self.generateBrandCell(tableView, cellForRowAt: indexPath)
        
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        default:
            return 2
        }
        //return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
}

extension BrandViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section  == 0 {
            
            let header = tableView.dequeueReusableCell(withIdentifier:HeaderTitleTableViewCell.identifier) as! HeaderTitleTableViewCell
            
            header.firstTitleLineLabel.text = "Recomendados"
            header.secondTitleLineLabel.text = "Para Você"
            
            return header
        }else {
            
            let header = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier) as! HeaderTitleTableViewCell
            header.selectionStyle = .none
            header.firstTitleLineLabel.text = "TODAS"
            header.secondTitleLineLabel.text = "AS LOJAS"
            
            return header

        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0.1
        } else {
            return 70
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
            
        case 0:
            
            switch indexPath.row {
                
            case 0:
                return 70
            case 1:
                return 310
            default:
                return 310
            }
        case 1:
            
            switch indexPath.row {
            case 0:
                return 310
            default:
                return 310
            }
        default:
            return 0
        }
    }
}




extension BrandViewController: callSegueProtocol {
    
    func callViewController(segueIndentifier:String){
        self.performSegue(withIdentifier:segueIndentifier, sender:self)
    }
}
