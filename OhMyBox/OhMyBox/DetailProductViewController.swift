//
//  DetailProductViewController.swift
//  OhMyBox
//
//  Created by Felipe perius on 24/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class DetailProductViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBarView: IconNavigationBar!
    @IBOutlet weak var boxButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var productImageViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var productNavbarTitleLabel: UILabel!
    @IBOutlet weak var navbarTitleLabelCenterYConstraint: NSLayoutConstraint!
    
    weak var productImageBlurView: UIVisualEffectView?
    var blurAnimator: UIViewPropertyAnimator?
    
    let productImageViewHeight: CGFloat = 334.0
    let navigationBarHeight: CGFloat = 64
    let bottomMargin: CGFloat = 40.0
    
    var product = Product()
    var buttonIndexPath = IndexPath.init(row: 3, section: 0)
    var isSelect = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNibs()
        initializeStatesButtons()
        setUpNavigationAppearance()
        setUpNavigationBar()
        setUpTableView()
        setUpBlurAnimator()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }
    
    func setUpBlurAnimator() {
        
        productImageBlurView = productImageView.blurWithStyle(nil)
        blurAnimator = UIViewPropertyAnimator(duration: 2.0, curve: .linear, animations: {})
        
        NotificationCenter.default.addObserver(self, selector: #selector(DetailProductViewController.reloadBlurAnimation), name: .UIApplicationWillEnterForeground, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadBlurAnimation()
        UIApplication.shared.statusBarStyle = self.preferredStatusBarStyle
    }
    
    func reloadBlurAnimation() {
        productImageBlurView?.effect = nil
        blurAnimator?.addAnimations {
            self.productImageBlurView?.effect = UIBlurEffect(style: .light)
        }
        blurAnimator?.startAnimation()
        blurAnimator?.pauseAnimation()
        
        let yOffset = tableView.contentOffset.y + tableView.contentInset.top
        updateBlurAnimation(yOffset)
    }
    
    func setUpTableView() {
        tableView.contentInset = UIEdgeInsetsMake(productImageViewHeight - navigationBarHeight, 0, bottomMargin, 0)
        tableView.estimatedRowHeight = 350.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func setUpNavigationBar() {
        navigationBarView.titleLabel.text = ""
        navigationBarView.view.backgroundColor = navigationBarView.view.backgroundColor?.withAlphaComponent(0.0)
    }
    
    func initializeStatesButtons() {
        
        self.likeButton.setImage(#imageLiteral(resourceName: "heartEmpty_button"), for: .normal)
        self.likeButton.setImage(#imageLiteral(resourceName: "heartFull_button"), for: .selected)
        
        self.boxButton.setImage(#imageLiteral(resourceName: "box_button"), for: .normal)
        self.boxButton.setImage(#imageLiteral(resourceName: "boxSelected_button"), for: .selected)
    }
    
    
    @IBAction func addToCart(_ sender: Any) {
        self.changeBoxButtonState()
    }
    
    @IBAction func setFavorite(_ sender: Any) {
        self.changeFavoriteButtonState()
        
    }
    
    func changeFavoriteButtonState() {
        if self.likeButton.isSelected {
            self.likeButton.isSelected = false
            
            self.likeButton.bouncingAnimation(true, duration: 0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0, animationOptions: .curveEaseIn
            )
            self.likeButton.fadeIn(0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0)
            
            
        } else {
            self.likeButton.isSelected = true
            
            self.likeButton.bouncingAnimation(true, duration: 0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0, animationOptions: .curveEaseIn
            )
            self.likeButton.fadeIn(0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0)
        }
    }
    
    func changeBoxButtonState() {
        
        if self.boxButton.isSelected {
            self.boxButton.isSelected = false
            
            self.boxButton.bouncingAnimation(true, duration: 0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0, animationOptions: .curveEaseIn
            )
            self.boxButton.fadeIn(0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0)
            
            
        } else {
            self.boxButton.isSelected = true
            
            self.boxButton.bouncingAnimation(true, duration: 0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0, animationOptions: .curveEaseIn
            )
            self.boxButton.fadeIn(0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0)
        }
        
    }
    
    
    func registerNibs() {
        tableView.registerNibFrom(ProductLabelTableViewCell.self)
        tableView.registerNibFrom(ProductOptionsTableViewCell.self)
        tableView.registerNibFrom(ProductDetailTableViewCell.self)
        tableView.registerNibFrom(ProductBrandTableViewCell.self)
    }
    
    func generateProductLabelCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductLabelTableViewCell.identifier) as! ProductLabelTableViewCell
        
        cell.name = "Capa tropical"
        cell.price = 40.0
        
        return cell
    }
    
    func generateProductOptionsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductOptionsTableViewCell.identifier) as! ProductOptionsTableViewCell
        
        cell.colors = [.black, .red, .cyan, .purple]
        cell.sizes = ["PP", "M", "G", "GG"]
        
        return cell
    }
    
    func generateProductDetailsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailTableViewCell.identifier) as! ProductDetailTableViewCell
        
        cell.productDescription = "In hac habitasse platea dictumst. Vivamus adipiscing fermentum quam volutpat aliquam. Integer et elit eget elit facilisis tristique. Nam vel iaculis mauris. Sed ullamcorper tellus erat, non ultrices sem tincidunt euismod. Fusce rhoncus porttitor velit, eu bibendum nibh aliquet vel. Fusce lorem leo, vehicula at nibh quis, facilisis accumsan turpis."
        cell.productDetails = "Blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá blá"
        
        let buttonsHandler: UIButton.ButtonHandler = { _ in
            
            let contentOffset = tableView.contentOffset
            
            tableView.beginUpdates()
//            tableView.setContentOffset(contentOffset, animated: false)
            tableView.endUpdates()
            tableView.setContentOffset(contentOffset, animated: true)
        }
        
        cell.descriptionButtonHandler = buttonsHandler
        cell.detailsButtonHandler = buttonsHandler
        
        return cell
    }

    func generateProductBrandCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductBrandTableViewCell.identifier) as! ProductBrandTableViewCell
        
        cell.brandNameTopLine = "STAY CLOSE"
        cell.brandNameBottomLine = "Indie Store"
        
        return cell
    }
    
    func setUpNavigationAppearance() {
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.navigationBarView.boxButton.setImage(#imageLiteral(resourceName: "box_bold"), for: .normal)
        self.navigationBarView.leftBarButton.setImage(#imageLiteral(resourceName: "back_bold"), for: .normal)
    }
    
}

extension DetailProductViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        switch indexPath.row {
        case 0: cell = generateProductLabelCell(tableView, cellForRowAt: indexPath)
        case 1: cell = generateProductOptionsCell(tableView, cellForRowAt: indexPath)
        case 2: cell = generateProductDetailsCell(tableView, cellForRowAt: indexPath)
        case 3: cell = generateProductBrandCell(tableView, cellForRowAt: indexPath)
        default: cell = UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}

extension DetailProductViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        switch indexPath.row {
        case 0: height = ProductLabelTableViewCell.cellHeight
        case 1: height = ProductOptionsTableViewCell.cellHeight
        case 2: height = ProductDetailTableViewCell.cellHeight
        case 3: height = ProductBrandTableViewCell.cellHeight
        default: height = 0
        }
        
        return height
    }
    
}

extension DetailProductViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let yOffset = scrollView.contentOffset.y + scrollView.contentInset.top
        
        updateImageScale(yOffset)
//        updateNavigationBarAlpha(yOffset)
        updateBlurAnimation(yOffset)
        updateNavbarTitleYPosition(yOffset)
    }
    
    func updateImageScale(_ yOffset: CGFloat) {
        
        if yOffset < 0 {
            productImageViewHeightConstraint.constant = productImageViewHeight - yOffset
        } else if productImageViewHeightConstraint.constant != productImageViewHeight {
            productImageViewHeightConstraint.constant = productImageViewHeight
        } else if yOffset <= productImageViewHeight - navigationBarHeight {
            productImageViewTopConstraint.constant = -(yOffset * 0.5)
        }
    }
    
    func updateNavigationBarAlpha(_ yOffset: CGFloat) {
        let navbarAlphaThreshold: CGFloat = 128
        
        print(productImageViewHeight)
        if yOffset > (productImageViewHeight - navbarAlphaThreshold) {
            
            let alpha = (yOffset - (productImageViewHeight - navbarAlphaThreshold))/navigationBarHeight
            
            navigationBarView.view.backgroundColor = navigationBarView.view.backgroundColor?.withAlphaComponent(alpha)
        } else {
            navigationBarView.view.backgroundColor = navigationBarView.view.backgroundColor?.withAlphaComponent(0.0)
        }
    }
    
    func updateBlurAnimation(_ yOffset: CGFloat) {
        let navbarAlphaThreshold: CGFloat = 128.0
        let navbarAlphaScale: CGFloat = 64.0
        
        if yOffset > (productImageViewHeight - navbarAlphaThreshold) {
            
            let alpha = (yOffset - (productImageViewHeight - navbarAlphaThreshold))/navbarAlphaScale
            
            blurAnimator?.fractionComplete = min(alpha * 0.5, 0.5)
            
        } else {
            //            brandHeaderBlurView?.alpha = 0.0
            blurAnimator?.fractionComplete = 0.0
        }
    }
    
    func updateNavbarTitleYPosition(_ yOffset: CGFloat) {
        
        let defaultYPosition: CGFloat = 341
        navbarTitleLabelCenterYConstraint.constant = max(defaultYPosition - yOffset, 7)
    }
}
