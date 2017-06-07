//
//  DetailBrandViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class BrandDetailViewController: UIViewController {
    
// Mark: - Outlets
    let gradientPlaceholderColors = [UIColor.colorWithHexString("A87760").withAlphaComponent(0.63), UIColor.colorWithHexString("1A130F")]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    
    @IBOutlet weak var brandHeaderView: UIView!
    
    @IBOutlet weak var brandBackgroundImage: UIImageView!
    @IBOutlet weak var brandBackgroundFilterView: UIView!
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var brandNameTopLabel: UILabel!
    @IBOutlet weak var brandNameBottomLabel: UILabel!
    @IBOutlet weak var brandDescriptionLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    
    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var policyButton: UIButton!
    
    @IBOutlet weak var productNavbarTitleLabel: UILabel!
    @IBOutlet weak var navbarTitleLabelCenterYConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var brandHeaderViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var brandHeaderViewHeightConstraint: NSLayoutConstraint!

// Mark: - Properties
    weak var brandHeaderBlurView: UIVisualEffectView?
    var blurAnimator: UIViewPropertyAnimator?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBarTopConstraint: NSLayoutConstraint!
    
    var highlightsCollectionViewDelegate: BoxesCollectionViewDataSource?
    var newsCollectionViewDelegate: BoxesCollectionViewDataSource?
    
    let brandHeaderHeight: CGFloat = 382.0
    let tableViewTopMargin: CGFloat = 64
    
    var tableViewOffset = CGPoint()
    
    var presenter = BrandDetailPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchBar()
        setUpTableView()
        setUpNavigationBar()
        registerNibs()
        
        brandHeaderBlurView = brandBackgroundImage.blurWithStyle(nil)
        blurAnimator = UIViewPropertyAnimator(duration: 2.0, curve: .linear, animations: {})
        
        NotificationCenter.default.addObserver(self, selector: #selector(BrandDetailViewController.reloadBlurAnimation), name: .UIApplicationWillEnterForeground, object: nil)
        
        presenter.view = self
        
        presenter.loadBoxes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadBlurAnimation()
        UIApplication.shared.statusBarStyle = preferredStatusBarStyle
        
        updateInfo()
    }
    
    func updateInfo() {
        
        brandNameTopLabel.text = presenter.brandInfo?.name
        brandNameBottomLabel.text = presenter.brandInfo?.title
        brandDescriptionLabel.text = presenter.brandInfo?.brandDescription
        
        if let file = presenter.brandInfo?.brandImageFile {
            
            brandImageView.loadPFFile(file)
        }
    }
    
    func reloadBlurAnimation() {
        brandHeaderBlurView?.effect = nil
        blurAnimator?.addAnimations {
            self.brandHeaderBlurView?.effect = UIBlurEffect(style: .regular)
        }
        blurAnimator?.startAnimation()
        blurAnimator?.pauseAnimation()
        
        let yOffset = tableView.contentOffset.y + tableView.contentInset.top
        updateBlurAnimation(yOffset)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func registerNibs() {
        tableView.registerNibFrom(HomeTableViewHeaderView.self)
        tableView.registerNibFrom(CollectionTableViewCell.self)
    }
    
    func setUpSearchBar() {
        
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        
        setUpSearchBarAppearance()
    }
    
    func setUpSearchBarAppearance() {
        searchBar.barTintColor = .white
        
        // Getting rid of weird black separator
        searchBar.borderWidth = 1.0
        searchBar.borderColor = UIColor.white
        
        searchBar.tintColor = .black
        searchBar.backgroundColor = .white
    }
    
    func setUpTableView() {
        tableView.keyboardDismissMode = .interactive
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsetsMake(32.0 + searchBar.frame.height + brandHeaderHeight - tableViewTopMargin, 0, 0, 0)
    }
    
    func setUpNavigationBar() {
        navigationBarView.view.backgroundColor = navigationBarView.view.backgroundColor?.withAlphaComponent(0.0)
        
        navigationBarView.boxButton.tintColor = .white
        navigationBarView.leftBarButton.tintColor = .white
        
        navigationBarView.titleLabelText = ""
        navigationBarView.leftBarButton.setImage(#imageLiteral(resourceName: "back_bold"), for: .normal)
        navigationBarView.boxButton.setImage(#imageLiteral(resourceName: "box_bold"), for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SegueIdentifiers.brandDetailToContact {
            
            let vc = segue.destination as! BrandContactViewController
            vc.emailInfo = ("EMAIL", "bolado@gmail.com")
            vc.phoneInfo = ("TELEFONE", "(61) 98789-0987")
            vc.locationInfo = ("ONDE ESTÁ", "RUA 13 Norte Lt. 1/3 Loja 168  Vitrinni Shopping Águas Claras, DF 71909-720")
            vc.socialNetworkInfos = [(#imageLiteral(resourceName: "instagram_icon"), "@boladourban"), (#imageLiteral(resourceName: "facebook_icon"), "/boladourban"), (#imageLiteral(resourceName: "twitter_icon"), "@boladourban"), (#imageLiteral(resourceName: "youtube_icon"), "/boladourban")]
        }
    }
    
    @IBAction func contactButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: SegueIdentifiers.brandDetailToContact, sender: self)
    }
}

extension BrandDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        switch indexPath.section {
        case 0: cell = generateBoxesCell(tableView, cellForRowAt: indexPath, dataSourceReference: &newsCollectionViewDelegate)
        case 1: cell = generateBoxesCell(tableView, cellForRowAt: indexPath, dataSourceReference: &highlightsCollectionViewDelegate)
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
        
        return 2
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
    func generateBoxesCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, dataSourceReference: inout BoxesCollectionViewDataSource?) -> CollectionTableViewCell {
        
        let cell = generateCollectionTableCell(tableView, cellForRowAt: indexPath)
        
        let dataSource = BoxesCollectionViewDataSource(collectionView: cell.collectionView)
        dataSource.collectionSelectionDelegate = self
        dataSource.boxes = presenter.boxes
        dataSourceReference = dataSource
        
        cell.collectionViewDataSource = dataSource
        cell.collectionViewDelegate = dataSource
        
        dataSource.boxButtonHandler = { indexPath in
            
            CartManager.shared.updateCart(withBox: dataSource.boxes[indexPath.item])
        }
        
        return cell
    }
    
    func generateCollectionTableCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> CollectionTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        
        cell.layer.masksToBounds = false
        
        return cell
    }
}

extension BrandDetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let yOffset = scrollView.contentOffset.y + scrollView.contentInset.top
        
        updateImageScale(yOffset)
        updateBlurAnimation(yOffset)
        updateHeaderViewsAlpha(yOffset)
        updateStackButtonsZPosition(yOffset)
        updateSearchBarPosition(scrollView.contentOffset.y)
        updateNavbarTitleYPosition(yOffset)
    }
    
    func updateSearchBarPosition(_ yOffset: CGFloat) {
        
        let searchBarConstraintConstant = searchBar.frame.height + yOffset
        
        searchBarTopConstraint?.constant = max(0, -searchBarConstraintConstant)
    }
    
    func scrollTableViewToTop() {
        tableView.setContentOffset(CGPoint(x: 0, y: -44), animated: true)
    }
    
    func updateImageScale(_ yOffset: CGFloat) {
        
        if yOffset < 0 {
            brandHeaderViewHeightConstraint.constant = brandHeaderHeight - yOffset
            brandHeaderViewTopConstraint.constant = 0
        } else if brandHeaderViewHeightConstraint.constant != brandHeaderHeight {
            brandHeaderViewHeightConstraint.constant = brandHeaderHeight
        } else if yOffset <= brandHeaderHeight - tableViewTopMargin {
            brandHeaderViewTopConstraint.constant = -(yOffset * 0.5)
        }
    }
    
    func updateBlurAnimation(_ yOffset: CGFloat) {
        let navbarAlphaThreshold: CGFloat = 128.0
        let navbarAlphaScale: CGFloat = 64.0
        
        if yOffset > (brandHeaderHeight - navbarAlphaThreshold) {
            
            let alpha = (yOffset - brandHeaderHeight + navbarAlphaThreshold)/navbarAlphaScale
            
            blurAnimator?.fractionComplete = min(alpha * 0.5, 0.5)
            
            brandBackgroundFilterView.alpha = max((2 - alpha) * 0.25, 0.25)
            
        } else {
            blurAnimator?.fractionComplete = 0.0
            brandBackgroundFilterView.alpha = 0.5
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
    
    func updateStackButtonsZPosition(_ yOffset: CGFloat) {
        if yOffset <= 0 {
            
            view.bringSubview(toFront: buttonsStackView)
        } else {
            view.sendSubview(toBack: buttonsStackView)
        }
    }
    
    func updateNavbarTitleYPosition(_ yOffset: CGFloat) {
        
        let defaultYPosition: CGFloat = brandHeaderHeight - 25
        
        navbarTitleLabelCenterYConstraint.constant = max(defaultYPosition - yOffset, 7)
        
        let alpha = (30 - (defaultYPosition - yOffset))/20
        
        productNavbarTitleLabel.alpha = alpha
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
        
//        if colletionViewDelegate === highlightsCollectionViewDelegate {
//            
//            performSegue(withIdentifier: SegueIdentifiers.brandDetailToProductDetail, sender: self)
//        } else if colletionViewDelegate === collectionsCollectionViewDelegate {
//            
//            
//        } else if colletionViewDelegate === salesCollectionViewDelegate {
//            performSegue(withIdentifier: SegueIdentifiers.brandDetailToProductDetail, sender: self)
//        }
    }
}

extension BrandDetailViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        scrollTableViewToTop()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
}

extension BrandDetailViewController: BrandDetailView {
    
    func reloadData() {
        
    }
}
