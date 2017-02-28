//
//  HomeViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    var boxButtonItem: UIBarButtonItem?
    var clothingArray: [String] = []
    
    var filtered:[String] = []
    var allProduct = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillClothingArray()
        
        registerNibs()
        setUpNavigationBar()
        setUpTableView()
    }
    
    func fillClothingArray() {
        
        clothingArray.append("Cloting One")
        clothingArray.append("Cloting Two")
        clothingArray.append("cloting Three")
        clothingArray.append("cloting Four")
        clothingArray.append("cloting Five")
    }
    
    func setUpNavigationBar() {
     
        navigationController?.navigationBar.isHidden = true
        navigationBarView.leftBarButton.isHidden = true
        navigationBarView.layoutIfNeeded()
    }
    
    func setUpTableView() {
        
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.backgroundColor = .white
        tableView.layoutIfNeeded()
    }

    @IBAction func actionGoCart(_ sender: AnyObject) {
        
        self.performSegue(withIdentifier:"goCart", sender:nil)
    
    }
    
    func registerNibs() {
        
        //Header
        self.tableView.register(UINib(nibName: "HomeTableViewHeaderView", bundle: nil), forCellReuseIdentifier: HomeTableViewHeaderView.identifier)
        
        //Cells
        self.tableView.register(UINib(nibName: "ShowCaseCollectionViewCell", bundle: nil), forCellReuseIdentifier: ShowCaseCollectionViewCell.identifier)
          self.tableView.register(UINib(nibName: "PromotionTableViewCell", bundle: nil), forCellReuseIdentifier: PromotionTableViewCell.identifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            switch identifier {
            case "detailProduct": break
            case "goPromotion":
                if let destinationVC = segue.destination as? RecommendedViewController {
                    destinationVC.title = "Promoções"
                    destinationVC.titleHeader = "Promoções"
                    
                }
            case "goRecommended":
                if let destinationVC = segue.destination as? RecommendedViewController {
                    destinationVC.title = "Recomendados"
                    destinationVC.titleHeader = "Recomendados"
                }
            default: break
            }
        }
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell: UITableViewCell
        
        switch indexPath.section {
        case 0: cell = generateClosetCell(tableView, cellForRowAt: indexPath)
        case 1: cell = generateProductCell(tableView, cellForRowAt: indexPath)
        case 2: cell = generatePromotionCell(tableView, cellForRowAt: indexPath)
        default: cell = UITableViewCell()
        }
        
        return cell
    }
    
    func generateProductCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        
        cell.delegate = self

        return cell
    }
    
    
    func generatePromotionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PromotionTableViewCell.identifier, for: indexPath) as! PromotionTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    
    func generateClosetCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ClosetTableViewCell.identifier, for: indexPath) as! ClosetTableViewCell
                
        cell.tagType = .five
        cell.clothingtArray = self.clothingArray
        cell.identifierSegue = "goRecommended"
        cell.delegate = self
        
        return cell
    }
    
    func generateHeaderClosetCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier, for: indexPath) as! HeaderTitleTableViewCell
          cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            case 0, 1, 2:
                return 1
            default:
                return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.section == 2{
            if indexPath.row == 0{
                performSegue(withIdentifier:"goPromotion", sender:self)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
            case 0, 1:

                let width = self.view.bounds.size.width * 0.95
                let height = width*1.3
                //1.3
                return height
            case 2:
                
                let width = self.view.bounds.size.width * 0.66
                let height = width*1.6
                
                print ("ALTURA CELL: \(height)")
                
                return height

        
            case 3:
                return 50
            default:
                return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView: UIView?
        
        switch section {
        case 1:
            
            let header = tableView.dequeueReusableCell(withIdentifier:HomeTableViewHeaderView.identifier) as! HomeTableViewHeaderView
            
            header.topLineLabel.text = "OLHA AS"
            header.bottomLineLabel.text = "NOVIDADES"
            
            headerView = header
        case 2:
            
            let header = tableView.dequeueReusableCell(withIdentifier:HomeTableViewHeaderView.identifier) as! HomeTableViewHeaderView
            header.topLineLabel.text = "GENTE,"
            header.bottomLineLabel.text = "PROMOÇÃO!"
            
            headerView = header
            
        default:
            headerView = nil
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let height: CGFloat
        
        switch section {
        case 1, 2:
            height = HomeTableViewHeaderView.cellHeight
        default:
            height = 0
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
  
}
extension HomeViewController: callSegueProtocol {
    
    func callViewController(segueIndentifier: String){
        self.performSegue(withIdentifier: segueIndentifier, sender: self)
    }
}
