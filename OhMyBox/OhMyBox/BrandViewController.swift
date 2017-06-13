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
    
    var presenter = BrandPresenter()
    
    var followedBrandsCollectionViewDelegate: UICollectionViewDelegate!
    var recommendedBrandsCollectionViewDelegate: UICollectionViewDelegate!
    
    var selectedBrand: Brand?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpTableView()
        registerNibs()
        
        presenter.view = self
        
        presenter.loadBrands()
    }
    
    func setUpTableView() {
        tableView.backgroundColor = .white
    }
    
    func registerNibs() {
        tableView.registerNibFrom(BrandsTableViewCell.self)
        tableView.registerNibFrom(BrandsHeaderTableViewCell.self)
        tableView.registerNibFrom(BrandTableViewCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = preferredStatusBarStyle
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SegueIdentifiers.brandsToBrandDetail {
            
            guard let vc = segue.destination as? BrandDetailViewController else { return }
            vc.presenter.brand = selectedBrand
        }
    }
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationBarView.showsLeftBarButton = false
    }
}

//MARK: Cells generation
extension BrandViewController {
    
    func generateFollowedBrandsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> BrandsTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BrandsTableViewCell.identifier) as! BrandsTableViewCell
        
        cell.brands = presenter.brands
        followedBrandsCollectionViewDelegate = cell
        cell.selectionDelegate = self
        
        return cell
    }
    
    func generateRecommendedBrandsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> BrandsTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BrandsTableViewCell.identifier) as! BrandsTableViewCell
        
        cell.brands = presenter.brands
        recommendedBrandsCollectionViewDelegate = cell
        cell.selectionDelegate = self
        
        return cell
    }
    
    func generateBrandCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> BrandTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BrandTableViewCell.identifier) as! BrandTableViewCell
        
        cell.info = presenter.brandCellInfo(for: indexPath)
        
        return cell
    }

}

extension BrandViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        switch indexPath.section {
        case 0: cell = generateFollowedBrandsCell(tableView, cellForRowAt: indexPath)
        case 1: cell = generateBrandCell(tableView, cellForRowAt: indexPath)
        default: cell = UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let number: Int
        
        switch section {
        case 0: number = 1
        case 1: number = presenter.brands.count
        default: number = 0
        }
        
        return number
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

extension BrandViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedBrand = presenter.brands[indexPath.item]
        
        performSegue(withIdentifier: SegueIdentifiers.brandsToBrandDetail, sender: self)
    }
    
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
            header.topLineLabel.text = "TODAS AS MARCAS"
            header.bottomLineLabel.text = ""
            header.showAllButton.isHidden = true
        default: break
        }
        
        return header
    }
}

extension BrandViewController: CollectionViewSelectionDelegate {
    
    func collectionViewDelegate(_ colletionViewDelegate: UICollectionViewDelegate, didSelectItemAt indexPath: IndexPath) {
        
        selectedBrand = presenter.brands[indexPath.item]
        
        performSegue(withIdentifier: SegueIdentifiers.brandsToBrandDetail, sender: self)
    }
}

extension BrandViewController: BrandView {
    
    func reloadData() {
        
        tableView.reloadData()
    }
}
