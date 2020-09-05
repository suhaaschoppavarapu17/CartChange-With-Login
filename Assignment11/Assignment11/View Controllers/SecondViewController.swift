//
//  SecondViewController.swift
//  Assignment11
//
//  Created by Suhaas Choppavarapu on 9/3/20.
//  Copyright © 2020 Suhaas Choppavarapu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, CartChangeDelegate {
    
    //MARK:- Properties
    var indexValue: Int = 0
    var cartCount: Int = 0
    
    var productImage = ["jeep","bmw","acura","ford","lexus","rangerover","hyundai","audi"]
    var productNames = ["Jeep Rubicon","BMW X5","Acura RDX","Ford Explorer","Lexus RX 350","Range Rover","Hyundai Palisade","Audi Q7"]
    var productDescription = ["3.6L V6 Engine","3.0L V6 Engine","2.4L V4 Engine","3.0L V6 Engine","3.0L V6 Engine","3.0L V6 Engine","3.0L V6 Engine","3.0L V6 Engine"]
    var productQuantity: [Int] = [0,0,0,0,0,0,0,0]
    
    //MARK:- IBOutlets
    @IBOutlet weak var firstTableView: UITableView!
    
    //MARK:- View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTableView.dataSource = self
        firstTableView.delegate = self
        firstTableView.tableFooterView = UIView()
        firstTableView.backgroundColor = UIColor(red: 0.48, green: 0.62, blue: 0.62, alpha: 1.00)
    }
    
    //MARK:- Segue Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ThirdViewController {
            destination.proName = productNames[indexValue]
            destination.proDecription = productDescription[indexValue]
            destination.image = productImage[indexValue]
            destination.quantity = productQuantity[indexValue]
            destination.cartDelegate = self
        }
    }
    
    //MARK:- Helper Methods
    func cartDidChange(count: Int) {
        cartCount = count
        productQuantity.remove(at: indexValue)
        productQuantity.insert(cartCount, at: indexValue)
        firstTableView.reloadData()
    }
    
}

//MARK:- UITableViewDataSource Methods
extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = firstTableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier) as? FirstTableViewCell {
            
            cell.productName.text = productNames[indexPath.row]
            cell.productDescription.text = productDescription[indexPath.row]
            cell.productImage.image = UIImage(named: productImage[indexPath.row])
            cell.productQuantity.text = String(productQuantity[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

//MARK:- UITableViewDelegate Methods
extension SecondViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexValue  = indexPath.row
        performSegue(withIdentifier: "secondSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

//MARK:- UITableViewCell Class
class FirstTableViewCell: UITableViewCell {
    
    //MARK:- Properties
    static let identifier = "firstCell"
    
    //MARK:- IBOutlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productQuantity: UITextField!
}
