//
//  SearchContainerViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 22/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SearchContainerViewController: UIViewController {

    enum SearchControllers {
        case search
        case searchSuggestions
        
        var presentedAlphas: (search: CGFloat, searchSuggestions: CGFloat) {
            
            let alphas: (search: CGFloat, searchSuggestions: CGFloat)
            
            switch self {
            case .search: alphas = (1, 0)
            case .searchSuggestions: alphas = (0, 1)
            }
            
            return alphas
        }
    }
    
    @IBOutlet weak var searchViewContainer: UIView!
    @IBOutlet weak var searchSuggestionsViewContainer: UIView!
    
    @IBOutlet weak var searchBarContainer: UIView!
    
    var searchController: UISearchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchController()
        // Do any additional setup after loading the view.
    }
    
    func setUpSearchController() {
        searchBarContainer.addSubview(searchController.searchBar)
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.barTintColor = .white
        
        
        // Getting rid of weird black separator
        searchController.searchBar.borderWidth = 1.0
        searchController.searchBar.borderColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setActiveController(_ controller: SearchControllers) {

        let alphas = controller.presentedAlphas
        
        controllerSwitchAnimate {
            self.searchViewContainer.alpha = alphas.search
            self.searchSuggestionsViewContainer.alpha = alphas.searchSuggestions
        }
    }

    func controllerSwitchAnimate(_ animations: @escaping () -> ()) {
        UIView.animate(withDuration: 0.25, animations: animations)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchContainerViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        setActiveController(.searchSuggestions)
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        setActiveController(.search)
    }
}

extension SearchContainerViewController: UISearchControllerDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
