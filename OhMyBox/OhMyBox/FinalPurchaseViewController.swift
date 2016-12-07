//
//  FinalPurchaseViewController.swift
//  OhMyBox
//
//  Created by Felipe perius on 02/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class FinalPurchaseViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        // Do any additional setup after loading the view.
    }
    @IBAction func backOrder(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)

    
    }

    @IBAction func finalizePayment(_ sender: AnyObject) {
        self.performSegue(withIdentifier:"goHome", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerNib(){
        
        self.tableView.register(UINib(nibName: "HeaderFinalPurchaseTableViewCell", bundle: nil), forCellReuseIdentifier: HeaderFinalPurchaseTableViewCell.identifier)
        
        
        self.tableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: OrderTableViewCell.identifier)
        
        
        self.tableView.register(UINib(nibName: "DiscountTitleTableViewCell", bundle: nil), forCellReuseIdentifier: DiscountTitleTableViewCell.identifier)
        
          self.tableView.register(UINib(nibName: "DataUserTextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: DataUserTextFieldTableViewCell.identifier)
    }

    
    
    
    func generateDiscountCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row {
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: DiscountTitleTableViewCell.identifier, for: indexPath) as! DiscountTitleTableViewCell
                
                
                return cell

            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: DiscountTitleTableViewCell.identifier, for: indexPath) as! DiscountTitleTableViewCell
                cell.firstLabel.text = "Total"
                cell.secondLabel.text = "R$ 100,00"

                return cell
            
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: DiscountTitleTableViewCell.identifier, for: indexPath) as! DiscountTitleTableViewCell
                return cell
               
        }
    }
    
    func generateHeadrPurchaseCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderFinalPurchaseTableViewCell.identifier, for: indexPath) as! HeaderFinalPurchaseTableViewCell
       
        switch (indexPath.section) {
            case 0:
                return cell
        case 1:
            cell.headerTitleLabel.text = "PAGAMENTO E ENDEREÇO"
            
            return cell
            
        default:
            
            return cell
            
        }

    
    
    }
    
    
    func generateProductPurchaseCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.identifier, for: indexPath) as! OrderTableViewCell
        cell.lineSectionView.isHidden = true
        
        return cell
    }

    
    func generateDataUserTextFieldTableViewCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DataUserTextFieldTableViewCell.identifier, for: indexPath) as! DataUserTextFieldTableViewCell
          cell.selectionStyle = .none
         cell.lineSectionView.isHidden = true
        
        switch (indexPath.row) {
            case 1:
                cell.nameFieldLabel.text = "Cartão"
                cell.infoUserLabel.text = "*****-3336"
                cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            
                return cell
            case 2:
                cell.nameFieldLabel.text = "Aonde entregar"
                cell.infoUserLabel.text = "Quadra Sqn 309 Asa"
                cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
                
                
                return cell
            default:
                return cell
            
        }
    }

}
extension FinalPurchaseViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                 
        
        
            
        
        if indexPath.section == 0{
            switch indexPath.row {
            case 0:
                return self.generateHeadrPurchaseCell(tableView, cellForRowAt:indexPath)
            case 1:
                return self.generateProductPurchaseCell(tableView, cellForRowAt: indexPath)
            case 3:
                return self.generateDiscountCell(tableView, cellForRowAt: indexPath)
            case 4:
                return self.generateDiscountCell(tableView, cellForRowAt: indexPath)
            
            default:
                return  self.generateProductPurchaseCell(tableView, cellForRowAt: indexPath)
            }

        }else if indexPath.section == 1{
            switch indexPath.row {
            case 0:
                return self.generateHeadrPurchaseCell(tableView, cellForRowAt:indexPath)
            case 1:
                return self.generateDataUserTextFieldTableViewCell(tableView, cellForRowAt:indexPath)
            case 2:
                return self.generateDataUserTextFieldTableViewCell(tableView, cellForRowAt:indexPath)
            default:
                return UITableViewCell()
            }
        }
        else {
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    
    
    private func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section  == 0 {
            
            let header = tableView.dequeueReusableCell(withIdentifier:HeaderFinalPurchaseTableViewCell.identifier) as! HeaderFinalPurchaseTableViewCell
            
            header.headerTitleLabel.text = "LISTA"
           
            
            return header
        }else {
            let view = UIView()
            view.backgroundColor = UIColor.clear
            return view
        }
    }

    
    
}

extension FinalPurchaseViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
            
        case 0:
            
            switch indexPath.row {
                
            case 0:
                return 50
            case 1:
                return 140
            case 2:
                return 140
            case 3:
                return 50
            case 4:
                return 50
            default:
                return 0
            }
            
        case 1:
            switch indexPath.row {
            case 0:
                return 50
            case 1:
                return 100
            case 2:
                return 100
            
            case 3:
                 return 200
            default:
                return 0
            }
        case 2:
            switch indexPath.row {
            case 0:
                return 170
           
            default:
                return 0
            }
            
        default:
            return 100
        }
        
    }
}
    
       
    


