//
//  BrandViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 28/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class BrandViewController: UIViewController {
    
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    var allBrands: [Any] = [1, 2, 3]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpTableView()
        registerNibs()
    }
    
    func setUpTableView() {
        tableView.backgroundColor = .white
    }
    
    func registerNibs() {
        tableView.registerNibFrom(BrandsTableViewCell.self)
        tableView.registerNibFrom(BrandsHeaderTableViewCell.self)
        tableView.registerNibFrom(BrandTableViewCell.self)
    }
    
    func showAllFeatureds(sender: UIButton) {
        performSegue(withIdentifier: "goProductsView", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goProductsView" {
            
            if let destinationViewController = segue.destination as? RecommendedViewController {
                
                destinationViewController.isHiddenRecommendedTitle = true
                
            }
        }
        
    }
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func generateFollowedBrandsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BrandsTableViewCell.identifier) as! BrandsTableViewCell
        
        cell.brands = [1, 2, 3]
        
        return cell
    }
    
    func generateRecommendedBrandsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BrandsTableViewCell.identifier) as! BrandsTableViewCell
        
        cell.brands = [1, 2, 3]
        
        return cell
    }
    
    func generateBrandCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BrandTableViewCell.identifier) as! BrandTableViewCell
        
        return cell
    }

}

extension BrandViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        switch indexPath.section {
        case 0: cell = generateFollowedBrandsCell(tableView, cellForRowAt: indexPath)
        case 1: cell = generateRecommendedBrandsCell(tableView, cellForRowAt: indexPath)
        case 2: cell = generateBrandCell(tableView, cellForRowAt: indexPath)
        default: cell = UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let number: Int
        
        switch section {
        case 0, 1: number = 1
        case 2: number = allBrands.count
        default: number = 0
        }
        
        return number
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

extension BrandViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        switch indexPath.section {
        case 0, 1: height = BrandsTableViewCell.cellHeight
        case 2: height = BrandTableViewCell.cellHeight
        default: height = 0
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return BrandsHeaderTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: BrandsHeaderTableViewCell.identifier) as! BrandsHeaderTableViewCell
        
        switch section {
        case 0:
            header.topLineLabel.text = "MARCAS"
            header.bottomLineLabel.text = "QUE SIGO"
        case 1:
            header.topLineLabel.text = "RECOMENDADOS"
            header.bottomLineLabel.text = ""
        case 2:
            header.topLineLabel.text = "TODAS AS MARCAS"
            header.bottomLineLabel.text = ""
            header.showAllButton.isHidden = true
        default: break
        }
        
        return header
    }
}
