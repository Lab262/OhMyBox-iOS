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
    
    struct RestorableStateKeys {
        static let searchControllerIsActive = "searchControllerIsActiveKey"
        static let searchBarIsFirstResponder = "searchBarIsFirstResponderKey"
        static let searchBarText = "searchBarTextKey"
    }
    
    @IBOutlet weak var searchViewContainer: UIView!
    @IBOutlet weak var searchSuggestionsViewContainer: UIView!
    
    @IBOutlet weak var searchBarContainer: UIView!
    
    var searchController: UISearchController = UISearchController(searchResultsController: nil)
    
    var searchViewController: SearchViewController!
    var searchSuggestionsViewController: SearchSuggestionsViewController!
    var searchResultsTitle: String?
    var searchResultsHasCarousel = false
    
    var searchControllerWasActive = false
    var searchControllerSearchFieldWasFirstResponder = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchController()
        getChildViewControllersReferences()
        definesPresentationContext = true
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if searchControllerSearchFieldWasFirstResponder {
            searchController.searchBar.becomeFirstResponder()
        }
    }
    
    func getChildViewControllersReferences() {
        let vcs = childViewControllers
        for vc in vcs {
            
            if vc is SearchViewController {
                searchViewController = vc as! SearchViewController
                searchViewController.selectionDelegate = self
            } else if vc is SearchSuggestionsViewController {
                searchSuggestionsViewController = vc as! SearchSuggestionsViewController
                searchSuggestionsViewController.selectionDelegate = self
            }
        }
    }
    
    func setUpSearchController() {
        searchBarContainer.addSubview(searchController.searchBar)
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.barTintColor = .white
        
        
        // Getting rid of weird black separator
        searchController.searchBar.borderWidth = 1.0
        searchController.searchBar.borderColor = UIColor.white
        
        searchController.searchBar.tintColor = .black
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.definesPresentationContext = false
    }
    
    func setActiveController(_ controller: SearchControllers) {
        
        let alphas = controller.presentedAlphas
        
        controllerSwitchAnimate {
//            self.searchViewContainer.alpha = alphas.search
            self.searchSuggestionsViewContainer.alpha = alphas.searchSuggestions
        }
    }
    
    func controllerSwitchAnimate(_ animations: @escaping () -> ()) {
        UIView.animate(withDuration: 0.15, animations: animations)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSearchResults" {
            let vc = segue.destination as! SearchResultsViewController
            vc.products = [Product(), Product(), Product()]
            vc.navigationBarTitle = searchResultsTitle
            vc.hasCarousel = searchResultsHasCarousel
            searchControllerSearchFieldWasFirstResponder = searchController.searchBar.isFirstResponder
        }
    }
    
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
        searchResultsTitle = searchBar.text
        performSegue(withIdentifier: "goToSearchResults", sender: nil)
    }
    
}

extension SearchContainerViewController: TableViewSelectionDelegate {
    
    func tableViewDelegate(_ tableViewDelegate: UITableViewDelegate, didSelectRowWith title: String) {
        
        if tableViewDelegate === searchViewController {
            searchResultsTitle = title
            searchResultsHasCarousel = true
            performSegue(withIdentifier: "goToSearchResults", sender: nil)
        } else if tableViewDelegate === searchSuggestionsViewController {
            searchResultsTitle = title
            searchResultsHasCarousel = false
            performSegue(withIdentifier: "goToSearchResults", sender: nil)
        }
    }
}
