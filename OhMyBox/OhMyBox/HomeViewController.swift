//
//  HomeViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()

    }
    
    func registerNib() {
        
        self.tableView.register(UINib(nibName: "HeaderTitleTableViewCell", bundle: nil), forCellReuseIdentifier: HeaderTitleTableViewCell.identifier)
        self.tableView.register(UINib(nibName: "ShowCaseCollectionViewCell", bundle: nil), forCellReuseIdentifier: ShowCaseCollectionViewCell.identifier)
          self.tableView.register(UINib(nibName: "PromotionTableViewCell", bundle: nil), forCellReuseIdentifier: PromotionTableViewCell.identifier)
    
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if indexPath.section == 0{
            switch indexPath.row {
                case 0:
                    return self.generateHeaderClosetCell(tableView, cellForRowAt: indexPath)
                case 1:
                    return self.generateClosetCell(tableView, cellForRowAt: indexPath)
                default:
                    return UITableViewCell()
            }
        }else if indexPath.section == 1{
            switch indexPath.row {
                case 0:
                    let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier, for: indexPath) as! HeaderTitleTableViewCell
                    cell.firstTitleLineLabel.text = "OLHA AS"
                    cell.secondTitleLineLabel.text = "NOVIDADES"
                    cell.iconImage.image = UIImage(named:"textureSectionImage")
                    
                    return cell
                case 1:
                    return self.generateProductCell(tableView, cellForRowAt: indexPath)
                default:
                    return UITableViewCell()
            }
        }else if indexPath.section == 2{
            switch indexPath.row {
            case 0:
                return self.generatePromotionCell(tableView, cellForRowAt: indexPath)
            default:
                return UITableViewCell()
            }
        
        }else {
            return UITableViewCell()
        }
        
        
        
        
    }
    
    func generateProductCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        
        return cell
    }
    
    func generatePromotionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PromotionTableViewCell.identifier, for: indexPath) as! PromotionTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func generateClosetCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ClosetTableViewCell.identifier, for: indexPath) as! ClosetTableViewCell
        cell.delegate = self 
        return cell
    }
    
    func generateHeaderClosetCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier, for: indexPath) as! HeaderTitleTableViewCell
        
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }

}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        
    
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
                return 0
            }
            
        case 1:
            switch indexPath.row {
            case 0:
                return 70
            case 1:
                return 310
            default:
                return 0
            }
        case 2:
            switch indexPath.row {
            case 0:
                return 170
            default:
                return 0
            }

        default:
            return 100
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section  == 0 {
            
            let header = tableView.dequeueReusableCell(withIdentifier:HeaderTitleTableViewCell.identifier) as! HeaderTitleTableViewCell
            
            header.firstTitleLineLabel.text = "Recomendados"
            header.secondTitleLineLabel.text = "Para Você"
            
            return header
        }else {
            let view = UIView()
            view.backgroundColor = UIColor.clear
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0.1
        } else {
            return 70
            
        }
    }
  
}
extension HomeViewController: callSegueProtocol {

    func callRecommended() {
        self.performSegue(withIdentifier:"goRecommended", sender:self)
    }
}


