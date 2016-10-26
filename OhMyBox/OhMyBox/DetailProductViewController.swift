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
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
    }
    
    func registerNib() {
        
     
        self.tableView.register(UINib(nibName: "SimpleTextViewTableViewCell", bundle: nil), forCellReuseIdentifier: SimpleTextViewTableViewCell.identifier)
        
    }
    
    func generateProductCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailProudctTableViewCell.identifier, for: indexPath) as! DetailProudctTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    func generateAttributCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AttributesTableViewCell.identifier, for: indexPath) as! AttributesTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    func generateSizeProductCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SizeProductTableViewCell.identifier, for: indexPath) as! SizeProductTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }

    func generateSimpleTextVieCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SimpleTextViewTableViewCell.identifier, for: indexPath) as! SimpleTextViewTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
}

extension DetailProductViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return generateProductCell(tableView, cellForRowAt: indexPath)
        
        case 1:
            return generateAttributCell(tableView, cellForRowAt: indexPath)

        case 2:
            return generateSizeProductCell(tableView, cellForRowAt: indexPath)
            
        case 3:
            return generateSimpleTextVieCell(tableView, cellForRowAt: indexPath)
        
            
            
        default:
            return UITableViewCell()
        }

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    
    
}

extension DetailProductViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 360
        case 1:
            return 60
        case 2:
            return 80
        case 3:
            return 80
        
        default:
            return 497
        }
    }
    
    
}
