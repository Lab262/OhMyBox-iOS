//
//  HomeViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    var boxButtonItem: UIBarButtonItem?
    var clothingArray: [String] = []
    
    var filtered:[String] = []
    var allProduct = [Product]()
    
    var highlightsCollectionViewDelegate: UICollectionViewDelegate!
    var newsCollectionViewDelegate: UICollectionViewDelegate!
    var salesCollectionViewDelegate: UICollectionViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillClothingArray()
        
        registerNibs()
        setUpNavigationBar()
        setUpTableView()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.goToBoxViewController(_:)), name: Notifications.goToBoxViewController, object: nil)
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
        tableView.registerNibFrom(HomeTableViewHeaderView.self)
        
        //Cells
        tableView.registerNibFrom(HighlightsTableViewCell.self)
        tableView.registerNibFrom(MiniProductsTableViewCell.self)
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
    
    func goToBoxViewController(_ notification: Notification) {
        navigationBarView.goToCart {
            NotificationCenter.default.post(name: Notifications.selectBoxRequestsViewController, object: nil)
        }
        
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell: UITableViewCell
        
        switch indexPath.section {
        case 0:
            let highlightsCell = generateHighlightsCell(tableView, cellForRowAt: indexPath)
            
            highlightsCell.selectionDelegate = self
            highlightsCollectionViewDelegate = highlightsCell
            cell = highlightsCell
        case 1:
            
            let newsCell = generateNewsCell(tableView, cellForRowAt: indexPath)
            
            newsCell.selectionDelegate = self
            newsCollectionViewDelegate = newsCell
            cell = newsCell
        case 2:
            
            let salesCell = generateSalesCell(tableView, cellForRowAt: indexPath)
            
            salesCell.selectionDelegate = self
            salesCollectionViewDelegate = salesCell
            cell = salesCell
        default: cell = UITableViewCell()
        }
        
        return cell
    }
    
    func generateHighlightsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> HighlightsTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HighlightsTableViewCell.identifier, for: indexPath) as! HighlightsTableViewCell
        
        cell.highlights = [#imageLiteral(resourceName: "verao_de_saias"), #imageLiteral(resourceName: "verao_de_saias"), #imageLiteral(resourceName: "verao_de_saias")]
        
        return cell
    }

    func generateNewsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> MiniProductsTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MiniProductsTableViewCell.identifier, for: indexPath) as! MiniProductsTableViewCell
        
        cell.products = [1, 2, 3]
        
        return cell
    }
    
    func generateSalesCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> MiniProductsTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MiniProductsTableViewCell.identifier, for: indexPath) as! MiniProductsTableViewCell
        
        // set sales products
        cell.products = [1, 2, 3]
        
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
        return 3
    }

}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        switch indexPath.section {
        case 0: height = HighlightsTableViewCell.cellHeight
        case 1, 2: height = MiniProductsTableViewCell.cellHeight
        default: height = 0
        }
        
        return height
        
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
        return 40.0
    }
  
}

extension HomeViewController: CollectionViewSelectionDelegate {
    
    func collectionViewDelegate(_ colletionViewDelegate: UICollectionViewDelegate, didSelectItemAt indexPath: IndexPath) {
        
        let colletionViewDelegate: UICollectionViewDelegate! = colletionViewDelegate
        
        if colletionViewDelegate === highlightsCollectionViewDelegate {
            
            
            
        } else if colletionViewDelegate === newsCollectionViewDelegate {
            performSegue(withIdentifier: SegueIdentifiers.homeToProductDetail, sender: self)
            
        } else if colletionViewDelegate === salesCollectionViewDelegate {
            performSegue(withIdentifier: SegueIdentifiers.homeToProductDetail, sender: self)
            
        }
    }
}
