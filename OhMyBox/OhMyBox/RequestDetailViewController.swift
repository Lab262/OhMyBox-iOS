//
//  RequestDetailViewController.swift
//  OhMyBox
//
//  Created by André Marques da Silva Rodrigues on 09/05/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class RequestDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var notifyArrivalButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        registerNibs()
    }
    
    func registerNibs() {
        
        tableView.registerNibFrom(BoxProductTableViewCell.self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func notifyArrivalButtonAction(_ sender: UIButton) {
        
        performSegue(withIdentifier: SegueIdentifiers.shoppingRequestDetailToRating, sender: self)
    }
    
}

extension RequestDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return generateProductCell(tableView, cellForRowAt: indexPath)
    }
}

extension RequestDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BoxProductTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
}

// Mark: Cells generation
extension RequestDetailViewController {
    
    func generateProductCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BoxProductTableViewCell.identifier) as! BoxProductTableViewCell
        
        cell.info = ("Produto", "Fashion Store", "36", UIColor.clear, #imageLiteral(resourceName: "product_placeholder"))
        
        return cell
    }
}
