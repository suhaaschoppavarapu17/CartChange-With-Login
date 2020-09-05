//
//  ThirdViewController.swift
//  Assignment11
//
//  Created by Suhaas Choppavarapu on 9/3/20.
//  Copyright © 2020 Suhaas Choppavarapu. All rights reserved.
//

import UIKit

protocol CartChangeDelegate {
    func cartDidChange(count: Int)
}

class ThirdViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperValue: UILabel!
    
    
    //MARK:- Properties
    var cartDelegate: CartChangeDelegate?
    var conutInFVC : Int = 0
    var image: String?
    var proName: String?
    var proDecription: String?
    var quantity: Int = 0
    
    //MARK:- View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: image! )
        name.text = proName
        productDescription.text = proDecription
        title = proName
        stepperValue.text = String(quantity)
        stepperValue.backgroundColor = .white
        view.backgroundColor = UIColor(red: 0.48, green: 0.62, blue: 0.62, alpha: 1.00)
        stepper.value = Double(quantity)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        quantity = Int(stepper.value)
        cartDelegate?.cartDidChange(count: quantity)
    }
    
    //MARK:- IBAction
    @IBAction func stepperPressed(_ sender: UIStepper) {
        stepperValue.text = String(Int(sender.value))
    }
}
