//
//  DetailBrandViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class BrandDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    
    @IBOutlet weak var brandBackgroundImage: UIImageView!
    @IBOutlet weak var brandBackgroundFilterView: UIView!
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var brandNameTopLabel: UILabel!
    @IBOutlet weak var brandNameBottomLabel: UILabel!
    @IBOutlet weak var brandDescriptionLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    
    @IBOutlet weak var brandHeaderViewHeightConstraint: NSLayoutConstraint!
    weak var brandHeaderBlurView: UIVisualEffectView?
    
    weak var highlightsCollectionViewDelegate: UICollectionViewDelegate!
    weak var collectionsCollectionViewDelegate: UICollectionViewDelegate!
    weak var salesCollectionViewDelegate: UICollectionViewDelegate!
    
    let searchController = UISearchController(searchResultsController: nil)
    let brandHeaderHeight: CGFloat = 382.0
    let tableViewTopMargin: CGFloat = 64
    
    var highlights: [Any] = [1, 2, 3]
    var sales: [Any] = [1, 2, 3]
    var brandCollections: [Any] = [1, 2, 3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpNavigationBar()
        setUpSearchBar()
        registerNibs()
        
        brandHeaderBlurView = brandBackgroundImage.blurWithStyle(.light)
        brandHeaderBlurView?.alpha = 0
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func registerNibs() {
        tableView.registerNibFrom(MiniProductsTableViewCell.self)
        tableView.registerNibFrom(BrandCollectionsTableViewCell.self)
        tableView.registerNibFrom(HomeTableViewHeaderView.self)
        tableView.registerNibFrom(BrandShowAllProductsTableViewCell.self)
    }
    
    func setUpSearchBar() {
        
        let header = UIView(frame: searchController.searchBar.frame)
        header.addSubview(searchController.searchBar)
        tableView.tableHeaderView = header
        tableView.backgroundView = nil
        //        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.barTintColor = .white
        
        
        // Getting rid of weird black separator
        searchController.searchBar.borderWidth = 1.0
        searchController.searchBar.borderColor = UIColor.white
        
        searchController.searchBar.tintColor = .black
        searchController.searchBar.backgroundColor = .white
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.definesPresentationContext = false
    }
    
    func setUpTableView() {
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsetsMake(brandHeaderHeight - tableViewTopMargin, 0, 0, 0)
    }
    
    func setUpNavigationBar() {
        navigationBarView.view.backgroundColor = navigationBarView.view.backgroundColor?.withAlphaComponent(0.0)
        navigationBarView.titleLabelText = ""
        navigationBarView.leftBarButton.setImage(#imageLiteral(resourceName: "back_bold"), for: .normal)
        navigationBarView.boxButton.setImage(#imageLiteral(resourceName: "box_bold"), for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goProductsView" {
            
            if let destinationViewController = segue.destination as? RecommendedViewController {
                
                destinationViewController.isHiddenRecommendedTitle = true
                
            }
        }
        
    }
    
}

extension BrandDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        switch indexPath.section {
        case 0: cell = generateHighlightsCell(tableView, cellForRowAt: indexPath)
        case 1: cell = generateCollectionsCell(tableView, cellForRowAt: indexPath)
        case 2: cell = generateSalesCell(tableView, cellForRowAt: indexPath)
        case 3: cell = generateShowAllCell(tableView, cellForRowAt: indexPath)
        default: cell = UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header: UIView?
        
        switch section {
        case 0, 1, 2: header = headerForSection(section: section)
        case 3: header = nil
        default: header = nil
        }
        
        return header
    }
    
    func headerForSection(section: Int) -> HomeTableViewHeaderView {
        
        let header = generateHeader(tableView, viewForHeaderInSection: section)
        
        let headerTitle: String
        switch section {
        case 0: headerTitle = "Destaques"
        case 1:
            headerTitle = "Coleções"
            header.showAllButton.isHidden = true
        case 2: headerTitle = "Promoção"
        default: headerTitle = ""
        }
        
        header.topLineLabel.text = headerTitle
        header.bottomLineLabel.text = ""
        
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 4
    }
}

extension BrandDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        switch indexPath.section {
        case 0, 2: height = MiniProductsTableViewCell.cellHeight
        case 1: height = BrandCollectionsTableViewCell.cellHeight
        case 3: height = BrandShowAllProductsTableViewCell.cellHeight
        default: height = 0
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let height: CGFloat
        
        switch section {
        case 0, 1, 2: height = HomeTableViewHeaderView.cellHeight
        case 3: height = CGFloat.leastNonzeroMagnitude
        default: height = 0
        }
        
        return height
    }
    //
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20.0))
        view.backgroundColor = .white
        
        return view
    }
    
}

// MARK: - Generate Cells

extension BrandDetailViewController {
    
    func generateHeader(_ tableView: UITableView, viewForHeaderInSection section: Int) -> HomeTableViewHeaderView {
        let header = tableView.dequeueReusableCell(withIdentifier: HomeTableViewHeaderView.identifier) as! HomeTableViewHeaderView
        
        return header
    }
    
    func generateHighlightsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> MiniProductsTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MiniProductsTableViewCell.identifier) as! MiniProductsTableViewCell
        
        cell.products = highlights
        cell.selectionDelegate = self
        highlightsCollectionViewDelegate = cell
        
        return cell
    }
    
    func generateCollectionsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BrandCollectionsTableViewCell.identifier) as! BrandCollectionsTableViewCell
        
        cell.collections = brandCollections
        cell.selectionDelegate = self
        collectionsCollectionViewDelegate = cell
        
        return cell
    }
    
    func generateSalesCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> MiniProductsTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MiniProductsTableViewCell.identifier) as! MiniProductsTableViewCell
        
        cell.products = sales
        cell.selectionDelegate = self
        salesCollectionViewDelegate = cell
        
        return cell
    }
    
    func generateShowAllCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> BrandShowAllProductsTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BrandShowAllProductsTableViewCell.identifier) as! BrandShowAllProductsTableViewCell
        
        cell.productsCount = 120
        
        return cell
    }
}

extension BrandDetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let yOffset = scrollView.contentOffset.y + scrollView.contentInset.top
        
        updateImageScale(yOffset)
        updateNavigationBarAlpha(yOffset)
        updateHeaderViewsAlpha(yOffset)
    }
    
    func updateImageScale(_ yOffset: CGFloat) {
        
        if yOffset < 0 {
            brandHeaderViewHeightConstraint.constant = brandHeaderHeight - yOffset
        } else if brandHeaderViewHeightConstraint.constant != brandHeaderHeight {
            brandHeaderViewHeightConstraint.constant = brandHeaderHeight
        }
    }
    
    func updateNavigationBarAlpha(_ yOffset: CGFloat) {
        let navbarAlphaThreshold: CGFloat = 128.0
        let navbarAlphaScale: CGFloat = 64.0
        
        if yOffset > (brandHeaderHeight - navbarAlphaThreshold) {
            
            let alpha = (yOffset - brandHeaderHeight + navbarAlphaThreshold)/navbarAlphaScale
            
            brandHeaderBlurView?.alpha = alpha
            //            brandBackgroundFilterView.alpha = (1 - alpha)/2
            
        } else {
            brandHeaderBlurView?.alpha = 0.0
            //            brandBackgroundFilterView.alpha = 0.5
        }
    }
    
    func updateHeaderViewsAlpha(_ yOffset: CGFloat) {
        let threshold: CGFloat = 50.0
        let alphaHeight: CGFloat = 100.0
        
        if yOffset > threshold {
            
            let alpha = 1 - ((yOffset - threshold) / alphaHeight)
            setHeaderViewsAlpha(alpha)
        } else {
            setHeaderViewsAlpha(1)
        }
    }
    
    func setHeaderViewsAlpha(_ alpha: CGFloat) {
        brandImageView.alpha = alpha
        brandNameTopLabel.alpha = alpha
        brandNameBottomLabel.alpha = alpha
        brandDescriptionLabel.alpha = alpha
        followButton.alpha = alpha
    }
}

extension BrandDetailViewController: CollectionViewSelectionDelegate {
    
    func collectionViewDelegate(_ colletionViewDelegate: UICollectionViewDelegate, didSelectItemAt indexPath: IndexPath) {
        
        if colletionViewDelegate === highlightsCollectionViewDelegate {
            
            performSegue(withIdentifier: SegueIdentifiers.brandDetailToProductDetail, sender: self)
        } else if colletionViewDelegate === collectionsCollectionViewDelegate {
            
            
        } else if colletionViewDelegate === salesCollectionViewDelegate {
            performSegue(withIdentifier: SegueIdentifiers.brandDetailToProductDetail, sender: self)
        }
    }
}
